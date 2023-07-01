# Linux: package systems

## Compare

https://habr.com/ru/articles/673488/

## Appimage

Похожа на portable exe в винде

Простой

## Flatpak

+ sandboxing и распространения

задумывался как контейнер именно для GUI приложений

OSTree - разные приложения (ветки) используют один и тот же файл, он копируется только 1 раз.

## Snap

- в отличии от AppImage
  - все snap постоянно смонтированны в папку /snap
  - squashfs смонтированны через loop device, а не через fuse (поэтому lsblk выдается столько "мусора").

- Snap печально известен тем, что его приложения долго запускаются

- Минусы
  - Список
    - https://www.reddit.com/r/Ubuntu/comments/tq4v1b/comment/i2ge3dh
    - Snaps slow the boot process, the more you have installed, the slower it gets
