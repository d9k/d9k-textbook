# Kurento API

https://doc-kurento.readthedocs.io/en/6.11.0/features/kurento_api.html

* Media Element - functional unit performing a specific action on a media stream
  - capable of
    - receiving media from other elements (through media sources)
    - sending media to other elements (through media sinks)

* Media Pipeline - a chain of Media Elements. Represents a “pipe” capable of performing a sequence of operations over a stream.

## Media element types

* Input/Output Endpoints
  - Subtypes:
    - File - take the media from/to a file
      - `RecorderEndpoint` - output endpoint that provides function to store contents in reliable mode (doesn’t discard data). It contains Media Sink pads for audio and video.
      - `PlayerEndpoint` (see in Network section)
    - Network - take the media from/to the network
      - `RtpEndpoint` - remote networked peers, through the RTP protocol. It uses SDP for media negotiation
      - `HttpPostEndpoint` - accepts media using HTTP POST requests like HTTP file upload functio
      - `PlayerEndpoint` - retrieves content from file system, HTTP URL or RTSP URL and injects it into the Media Pipeline.
    - Capture - capturing the media stream directly from a camera/screen or other kind of hardware resource

* Filters
  - subtypes
    - Transforming (mixing, muxing, analyzing, augmenting)
      - `FaceOverlayFilter` detects faces in a video stream and overlaid it with a configurable image.
      - `GStreamerFilter` - a generic interface that allows to pipeline any single GStreamer element
    - Analyzing media
      - `ZBarFilter` - detects QR and bar codes in a video stream and raises a `CodeFoundEvent`

* Hubs
  - Media Objects in charge of managing multiple media flows in a pipeline
  - `Composite` - mixes the audio stream of its connected inputs and constructs a grid with the video streams of them
  - `DispatcherOneToMany` - sends a given input to all the connected HubPorts
  - `Dispatcher` - hub that allows routing between arbitrary input-output HubPort pairs



