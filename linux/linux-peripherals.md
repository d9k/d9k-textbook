mouse speed change
------------------
xinput --set-prop "Logitech USB Optical Mouse" 264 1.2

http://askubuntu.com/questions/205676/cant-change-mouse-speed-in-12-10

$ sudo apt-get install imwheel
$ nano ~/.imwheelrc

".*"
None,       Up,     Up,     3
None,       Down,   Down,   3

$ killall imwheel
$ imwheel