# Lunux: X server

## What is Xauthority?

- :speech_balloon: [Объясните для тупых, как работает .Xauthority? | linux.org.ru](https://www.linux.org.ru/forum/desktop/9546821)

- :speech_balloon: [login - What is the .Xauthority file? - Ask Ubuntu](https://askubuntu.com/questions/300682/what-is-the-xauthority-file)
	- :information_source: can be found in each user home directory and is used to store credentials in cookies used by `xauth` for authentication of X sessions. Once an X session is started, the cookie is used to authenticate connections to that specific display.