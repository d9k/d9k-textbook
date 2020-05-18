# WebRTC: управление ICE-кандидатами

ICE candidate - Interactive Connectivity Establishment candidate.

Стандарт: https://tools.ietf.org/rfc/rfc8445.txt

## Статус

https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/iceConnectionState
https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/iceconnectionstatechange_event

```
pc.addEventListener("iceconnectionstatechange", ev => {
  if (pc.iceConnectionState === "disconnected") {
    closeVideoCall(pc);  // Our code to shut down the call
  }
}, false);
```

`{"new", "checking", "connected", "completed", "failed", "disconnected", "closed"}`

