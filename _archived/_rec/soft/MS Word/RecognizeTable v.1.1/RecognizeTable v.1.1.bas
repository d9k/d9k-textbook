Attribute VB_Name = "RecognizeTable"
Dim myPara As Paragraph
Dim maxH As Integer 'высота таблицы (вычисляется)
Dim maxW As Integer 'ширина таблицы (вычисляется)
Dim cellIndex As Integer

Const maxCell = 100
Dim lastCell As Integer
Dim myCell(maxCell, 4) As Integer
'0 - номер таблицы
'1 - х верхнего левого угла
'2 - у верхнего левого угла
'3 - х правого нижнего
'4 - у правого нижнего

Const maxRow = 50 ' максимальное число строк в таблице
Const maxColumn = 50 ' максимальное число колонок в таблице
Dim log_x(maxColumn) ' массив логических координат по x
Dim log_y(maxRow)    ' массив логических координат по y
'логические координаты
Dim iLogX As Integer
Dim iLogY As Integer
'и их индексы (по сути - размеры будущей таблицы)

Dim cellText(maxCell) As String 'текст для каждой ячейки

Dim tableMask(maxColumn, maxRow) As Integer
'  1 - ячейка существует
'  0 - взять координату из ячейки левее
' -1 - взять координату из ячейки выше

' правьте функции
' isTopRight
' isBottomRight
' isTopLeft
' в них заданы символы, которыми нарисованы углы таблиц


Sub main()
    getBounds
    findAllCells
    makeLogXY
    makeTable
End Sub
Sub makeTable()
Dim myRange As Range
Dim myTable As Table
'    Set myRange = Selection.Range
'    With myRange
'        .Collapse Direction:=wdCollapseStart
'    End With
    
    Selection.Collapse Direction:=wdCollapseStart
    ' после отладки - убрать, чтобы новая таблица
    ' вставлялась на место старой

    ActiveDocument.Tables.Add Range:=Selection.Range, _
        NumRows:=iLogY - 1, NumColumns:=iLogX - 1, _
        DefaultTableBehavior:=wdWord9TableBehavior, _
        AutoFitBehavior:=wdAutoFitFixed
    
    Set myTable = Selection.Tables(1)
    ' заполняем таблицу содержимым
    For myCellIndex = 1 To lastCell
        myRow = getLogY(myCell(myCellIndex, 2))
        myColumn = getLogX(myCell(myCellIndex, 1))
        myTable.Rows(myRow).Cells(myColumn).Range.Text = cellText(myCellIndex)
    Next
    ' заполняем таблицу координат
    Call fillTableCrd
    
    
    ' группируем ячейки
    For myCellIndex = 1 To lastCell
        myRow1 = getLogY(myCell(myCellIndex, 2))
        myColumn1 = getLogX(myCell(myCellIndex, 1))
        myRow2 = getLogY(myCell(myCellIndex, 4)) - 1
        myColumn2 = getLogX(myCell(myCellIndex, 3)) - 1
        myW = myColumn2 - myColumn1
        myH = myRow2 - myRow1
        If (myH > 0) Or (myW > 0) Then
            Call cnvCoords(myColumn1, myRow1)
            myTable.Cell(myRow1, myColumn1).Select
            Set myRange1 = Selection.Range
            Call cnvCoords(myColumn2, myRow2)
            myTable.Cell(myRow2, myColumn2).Select
            Set myRange2 = Selection.Range
            myRange1.SetRange Start:=myRange1.Start, End:=myRange2.End
            myRange1.Select
            Selection.Cells.Merge
            Call updCrds(myColumn1, myRow1, myColumn2, myRow2)
        End If
    Next
        

End Sub
Sub updCrds(x1, y1, x2, y2)
    tableMask(x1, y1) = 1 ' но можно и не делать, там и так уже 1
    For myY = y1 + 1 To y2
        tableMask(x1, myY) = -1
    Next
    For myX = x1 + 1 To x2
        For myY = y1 To y2
            tableMask(myX, myY) = 0
        Next
    Next
End Sub
Sub cnvCoords(x, y)
Dim nZeros As Integer
    x = findX(x, y)
    y = findY(x, y)
    
    nZeros = 0
    For i = x To 1 Step -1
        If tableMask(i, y) = 0 Then
            nZeros = nZeros + 1
        End If
    Next
    x = x - nZeros
    
End Sub
Function findX(x, y) As Integer
    For i = x To 1 Step -1
        If tableMask(i, y) <> 0 Then
            findX = i
            Exit Function
        End If
    Next
    MsgBox ("findX не нашла столбец!")
End Function
Function findY(x, y) As Integer
    For i = y To 1 Step -1
        If tableMask(x, i) = 1 Then
            findY = i
            Exit Function
        End If
    Next
    MsgBox ("findY не нашла левый верхний угол!")
End Function
Sub fillTableCrd()
    For myRow = 1 To iLogY - 1
        For myColumn = 1 To iLogX - 1
           tableMask(myColumn, myRow) = 1
        Next
    Next
End Sub
Function getLogX(theCoord) As Integer
    For i = 1 To iLogX
        If log_x(i) = theCoord Then
            getLogX = i
            Exit Function
        End If
    Next
    getLogX = 0
    MsgBox ("не найдена логическая координата ячейки")
End Function
Function getLogY(theCoord) As Integer
    For i = 1 To iLogY
        If log_y(i) = theCoord Then
            getLogY = i
            Exit Function
        End If
    Next
    getLogY = 0
    MsgBox ("не найдена логическая координата ячейки")
End Function

Function getBounds()
' вычисляем высоту и ширину таблицы (в символах)
maxH = Selection.Paragraphs.Count
maxW = 0
For i = 1 To maxH
    theLen = Selection.Paragraphs.Item(i).Range.Characters.Count
    If maxW < theLen Then maxW = theLen
Next
'MsgBox ("maxW=" & maxW & "     maxH=" & maxH)
End Function
Sub makeLogXY()
iLogX = 1
iLogY = 1
log_x(1) = myCell(1, 1)
log_y(1) = myCell(1, 2)
    For i = 1 To lastCell
            Call addAndSort(myCell(i, 1), iLogX, log_x)
            Call addAndSort(myCell(i, 3), iLogX, log_x)
            Call addAndSort(myCell(i, 2), iLogY, log_y)
            Call addAndSort(myCell(i, 4), iLogY, log_y)
    Next
    
End Sub
Sub addAndSort(n As Integer, maxIndex, theArray)
    For i = 1 To maxIndex
        If theArray(i) = n Then Exit Sub
        If theArray(i) > n Then
            For j = maxIndex To i Step -1
                theArray(j + 1) = theArray(j)
            Next
            theArray(i) = n
            maxIndex = maxIndex + 1
            Exit Sub
        End If
    Next
    maxIndex = maxIndex + 1
    theArray(maxIndex) = n
    
End Sub
Function isInArray(n As Integer, maxIndex, theArray) As Boolean
Dim flag As Boolean
    flag = False
    For i = 1 To maxIndex
        If theArray(i) = n Then
            flag = True
            Exit For
        End If
    Next
isInArray = flag
End Function
Function findAllCells()
cellIndex = 1
For theY = 1 To maxH - 2
    For theX = 1 To maxW - 2
        myString = getSequence(theX, theY, theX + 1, theY + 1)
        If isTopLeft(myString) Then
            myCell(cellIndex, 1) = theX
            myCell(cellIndex, 2) = theY
            myOtherCorner = getBottomRight(theX, theY)
            myCell(cellIndex, 3) = myOtherCorner(1)
            myCell(cellIndex, 4) = myOtherCorner(2)
            
            cellText(cellIndex) = ""
            For myCellLine = theY + 1 To myOtherCorner(2) - 1
                cellText(cellIndex) = cellText(cellIndex) & Chr(11) & _
                getSequence(theX + 1, myCellLine, myOtherCorner(1) - 1, myCellLine)
            Next
            cellIndex = cellIndex + 1
        End If
    Next
Next

lastCell = cellIndex - 1

'MsgBox ("done")

End Function
Function getBottomRight(theX, theY)
Dim myCoords(2) As Variant
    For myX = theX + 1 To maxW
        myString = getSequence(myX - 1, theY, myX, theY + 1)
        If isTopRight(myString) Then Exit For
    Next

    For myY = theY + 1 To maxH
        myString = getSequence(myX - 1, myY - 1, myX, myY)
        If isBottomRight(myString) Then Exit For
    Next
    
    myCoords(1) = myX
    myCoords(2) = myY
    getBottomRight = myCoords
End Function
Function isTopRight(theString) As Boolean
    Select Case Left(theString, 2) & Right(theString, 1)
        Case "-+|"
            isTopRight = True
        Case "--|"
            isTopRight = True
        Case "-||"
            isTopRight = True
        Case "-+¦"
            isTopRight = True
        Case Else
            isTopRight = False
    End Select
End Function

Function isBottomRight(theString) As Boolean
    Select Case Right(theString, 3)
        Case "|-+"
            isBottomRight = True
        Case "|-|"
            isBottomRight = True
        Case "|--"
            isBottomRight = True
        Case "¦-+"
            isBottomRight = True
        Case Else
            isBottomRight = False
    End Select
End Function

Function isTopLeft(theString) As Boolean
    Select Case Left(theString, 3)
        Case "+-|"
            isTopLeft = True
        Case "+-¦"
            isTopLeft = True
        Case "--¦"
            isTopLeft = True
        Case "--|"
            isTopLeft = True
        Case "¦-¦"
            isTopLeft = True
        Case "|-|"
            isTopLeft = True
        Case Else
            isTopLeft = False
    End Select
End Function
Function getSequence(myX1, myY1, myX2, myY2)
'предполагается, что работаем с объектом Selection
    myStr = ""
    For theY = myY1 To myY2
        For theX = myX1 To myX2
            myStr = myStr & getChar(theX, theY)
        Next
    Next
    getSequence = myStr
End Function

Function getChar(myX, myY) As String
    getChar = Selection.Paragraphs.Item(myY).Range.Characters.Item(myX)
End Function
