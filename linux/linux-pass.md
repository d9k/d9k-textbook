Linux pass util
===============

https://www.passwordstore.org/

    gpg --list-keys
    pass init public_key_id
    pass git init
    pass git remote add origin bitbucket_url_to_copy
    pass git push

https://github.com/zeapo/Android-Password-Store#readme

[] gpg
  [] about
    https://wiki.archlinux.org/index.php/GnuPG_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
  [] min
    http://eax.me/gpg/

## export/import keys

https://www.phildev.net/pgp/gpg_moving_keys.html

`-a`: ascii-armored (non-binary) format

    gpg --export-secret-keys -a keyid > my_private_key.asc
    gpg --export -a keyid > my_public_key.asc

    gpg --import my_private_key.asc
    gpg --import my_public_key.asc

    gpg --edit-key public_key_id
    Command> trust
    5 (ultimate)
