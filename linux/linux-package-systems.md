# Linux: package systems

## Compare

- [Как работают snap, flatpak, appimage / Хабр](https://habr.com/ru/articles/673488/)
- [Flatpak против Snap: 10 отличий, которые вы должны знать - Linux Mint Россия](https://linuxmint.su/2023/01/28/flatpak-%D0%BF%D1%80%D0%BE%D1%82%D0%B8%D0%B2-snap-10-%D0%BE%D1%82%D0%BB%D0%B8%D1%87%D0%B8%D0%B9-%D0%BA%D0%BE%D1%82%D0%BE%D1%80%D1%8B%D0%B5-%D0%B2%D1%8B-%D0%B4%D0%BE%D0%BB%D0%B6%D0%BD%D1%8B-%D0%B7/)
- [Flatpak or Snap? : r/linuxmasterrace](https://www.reddit.com/r/linuxmasterrace/comments/u4te9z/flatpak_or_snap/)

## Введение

В мире windows победила идеология, где каждое приложение тащит свои зависимости с собой (за исключением совсем системных

## Appimage

Похожа на portable exe в винде

Простой, быстрый (браузер лучше ставить нативно или в Appimage)

- [apps – AppImages](https://appimage.github.io/apps/)

## Flatpak

- Flatpak был создан Александром Ларссоном, главным инженером-программистом Red Hat, имеет полностью открытый код.

+ sandboxing и распространения

- задумывался как контейнер именно для GUI приложений

- OSTree - разные приложения (ветки) используют один и тот же файл, он копируется только 1 раз.

- Отличия от Snap
	- Flatpak is only for desktop applications (and GUI apps at that)

- :tv: [Why I No Longer Use Flatpak | The Linux Cast | YT](https://www.youtube.com/watch?v=zlF0-_kzRY4)

- [Run-Flatpak-Windows11](https://github.com/AbelFalcon/Run-Flatpak-Windows11?tab=readme-ov-file) by [AbelFalcon](https://github.com/AbelFalcon)
	- _ℹ️ Running Flatpak Apps on Windows 10/11 in Seconds_

- [Packages search | Flathub](https://flathub.org/)
- :zap: `flatpak list`

## Snap

- Snap был разработан Canonical для создания приложений для платформ IoT.

- в отличии от AppImage
  - все snap постоянно смонтированны в папку /snap
  - squashfs смонтированны через loop device, а не через fuse (поэтому lsblk выдается столько "мусора").

- Snap печально известен тем, что его приложения долго запускаются

- Отличия от Flatpak
	- Проще разрабатывать пакеты: Snap помогает с разрешением зависимостей

- Минусы
  - Список
    - https://www.reddit.com/r/Ubuntu/comments/tq4v1b/comment/i2ge3dh
    - Snaps slow the boot process, the more you have installed, the slower it gets

- [Packages search | Snapcraft](https://snapcraft.io/store)
- :zap: `snap list --all`
