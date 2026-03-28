Основные команды и сочетания клавиш vim
=======================================

`:wq`, `:x` - выход с сохранением
		
Использованная литература
-------------------------

`<http://www.linode.com/wiki/index.php/Vim_Tutorial>`_

get key code for remapping
--------------------------

	:map ctrl+V [key-combination]

copy/paste
----------

Cut and paste:

1. Position the cursor where you want to begin cutting.
2. Press v to select characters (or uppercase V to select whole lines).
3. Move the cursor to the end of what you want to cut.
4. Press d to cut (or y to copy).
5. Move to where you would like to paste.
6. Press P to paste before the cursor, or p to paste after. 

Copy and paste is performed with the same steps except for step 4 where you would press y instead of d:

* d = delete = cut
* y = yank = copy 

reopen with utf8
----------------

`:e ++enc=utf-8`

