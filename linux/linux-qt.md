# Linux: QT

## QT5: тёмная тема

```
sudo apt install qt5ct qt5-gtk-platformtheme qt5-style-plugins
#export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=gtk2
export QT_STYLE_OVERRIDE=gtk2
qt5ct
```

мб стоит прописать константы в `/etc/environment` (без `export`)
