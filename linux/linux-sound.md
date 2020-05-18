Linux sound
===========

Skype
-----

1)

	export PULSE_LATENCY_MSEC=30

before skype run

2)

	pacman -R pulseaudio manjaro-pulse  pulseaudio-alsa
	pacman -S alsa-utils
	work for me


https://forum.manjaro.org/index.php?topic=5167.0

3)

WTF?

https://bbs.archlinux.org/viewtopic.php?id=125573

Play sound from bash
--------------------

`paplay sound_file.wav`
`mplayer sound_file.mp3 >/dev/null 2>&1`