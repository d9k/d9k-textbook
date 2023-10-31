# Linux: keyboard

## Input greek letters

`apt install uim`, logout, edit `~/.XCompose`, restart app

```
<Multi_key> <p> <i>            : "π"   U03C0    # GREEK SMALL LETTER PI
```

`grep -i greek /usr/share/X11/locale/en_US.UTF-8/Compose` to find greek key codes

- [Arch Linux - How to create lowercase pi (“π”) with compose key? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/248014/how-to-create-lowercase-pi-%cf%80-with-compose-key/307711#307711)


## remap caps lock

keycode 66 = Return
clear Lock

xmodmap

http://askubuntu.com/questions/53038/how-do-i-remap-the-caps-lock-key%D0%BA%D0%BFrth
http://askubuntu.com/questions/24916/how-do-i-remap-certain-keys