# Flatpak

## Add permission

`sudo flatpak override ApplicationIDHere --filesystem=host`

https://askubuntu.com/questions/1086529/how-to-give-a-flatpak-app-access-to-a-directory


## Remove redundant nvidia-* packages

flatpak remove --runtime --unused

https://www.reddit.com/r/Fedora/comments/xr1276/how_do_i_remove_these_duplicate_flatpak_nvidia/