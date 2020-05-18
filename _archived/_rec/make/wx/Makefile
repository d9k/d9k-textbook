 CXX = g++
 CXXFLAGS = -I/usr/local/lib/wx/include/msw-unicode-release-static-2.9 -I/usr/local/include/wx-2.9 -D_LARGEFILE_SOURCE=unknown -D__WXMSW__ -mthreads
 LIBS = -L/usr/local/lib  -mthreads  -Wl,--subsystem,windows -mwindows /usr/local/lib/libwx_mswu_xrc-2.9.a /usr/local/lib/libwx_mswu_html-2.9.a /usr/local/lib/libwx_mswu_qa-2.9.a /usr/local/lib/libwx_mswu_adv-2.9.a /usr/local/lib/libwx_mswu_core-2.9.a /usr/local/lib/libwx_baseu_xml-2.9.a /usr/local/lib/libwx_baseu_net-2.9.a /usr/local/lib/libwx_baseu-2.9.a -lwxregexu-2.9 -lwxexpat-2.9 -lwxtiff-2.9 -lwxjpeg-2.9 -lwxpng-2.9 -lwxzlib-2.9 -lrpcrt4 -loleaut32 -lole32 -luuid -lwinspool -lwinmm -lshell32 -lcomctl32 -lcomdlg32 -lctl3d32 -ladvapi32 -lwsock32 -lgdi32 

 BUILD=release
 
 PROGRAM = wx_test.exe
 DEBUGNAME = wxTest_NB
 
 OBJECTS = main.o
 
 #R_SIZE_BUILD=-ffunction-sections -fdata-sections
 #R_SIZE_LINK=-Wl,--gc-sections
 
 R_SIZE_BUILD=-s
 R_SIZE_LINK=-s
 
# implementation
 
#.SUFFIXES:      .o .cpp
 
all: $(PROGRAM)
 
$(PROGRAM): $(OBJECTS)
	$(CXX) $(R_SIZE_LINK) -o $(PROGRAM) $(OBJECTS) $(LIBS)
	#cp ./$(PROGRAM) ./dist/Debug/MinGW-Windows/$(DEBUGNAME)
 
main.o : main.cpp
	$(CXX) $(R_SIZE_BUILD) $(R_SIZE) -c  $(CXXFLAGS) -o $@ $<
 
clean:
	rm -f *.o $(PROGRAM)

run:	
	./$(PROGRAM)
    
reduce:
	#strip --strip-all $(PROGRAM)
	upx -9 $(PROGRAM)
    
