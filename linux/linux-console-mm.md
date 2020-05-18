Console Multimedia Tools
========================

Youtube downloader
------------------

Установить (могут понадобиться дополнительные ppa)

	sudo apt-get install youtube-dl ffmpeg

узнать форматы:
	
	youtube-dl -F "http://www.youtube.com/watch?v=3JZ_D3ELwOQ"

	...
	140         m4a       audio only  DASH audio , audio@128k
	...
	137         mp4       1080p       DASH video 
	...

скачать

	youtube-dl -f 137+140 "http://www.youtube.com/watch?v=3JZ_D3ELwOQ"


[туториал](http://www.webupd8.org/2014/02/video-downloader-youtube-dl-gets.html)


mp3 download

	youtube-dl --extract-audio --audio-format mp3 <video URL>
