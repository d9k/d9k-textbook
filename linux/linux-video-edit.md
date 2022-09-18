# Linux: video convert/edit

## Отрезать кусок видео

```
ffmpeg -ss 0:00:05.855 -to 0:01:20.473 -i 'my-source-video.mp4' -c copy "my-video-clip.mp4"
```
