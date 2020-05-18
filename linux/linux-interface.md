Install ttf terminus font
-------------------------
http://www.ax86.net/terminus


move to `/usr/local/share/fonts/truetype/terminus` (or to `/usr/share/fonts/truetype/terminus`)
http://www.wikihow.com/Install-TrueType-Fonts-on-Ubuntu

update:

	sudo fc-cache -f -v

save screenshot
---------------

shutter
~~~~~~~

`shutter -a -e -o ~/screenshots/%y-%m-%d_$w_$h.png`

`-a` - all screen
`-e` - exit after screenshot
`-o` - output file pattern

scrot '%Y_%m_%d_$wx$h.png' -e 'mv $f ~/screenshots/'
