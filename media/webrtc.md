# WebRTC

## Термины WebRTC

* Сигнальный сервер — это координирующий центр WebRTC, который обеспечивает коммуникацию между клиентами, инициализацию и закрытие соединения, отчеты об ошибках.

* ICE candidate? - Interactive Connectivity Establishment candidate.

* ICE - фреймворк описывает способы обхода NAT, способы установки соединения, если у нас есть NAT

* SIP - Session Initiation Protocol. SIP is only involved for the signaling operations of a media communication session and is primarily used to set up and terminate voice or video calls. SIP can be used to establish two-party (unicast) or multiparty (multicast) sessions.

* SDP - session description protocol - формат Call Offer и Call Answer

* STUN - Session Traversal Utilities for NAT” -allows clients to learn what their public NAT’d IP address and port is. Once this is achieved it’s possible to provide the correct details to other clients that want to connect to your client. Typically, a STUN server is needed. This protocol does not work for symmetric NATs. STUN essentially is a “What is my IP?” service

* UDP - User Datagram Protocol

* DTLS - Datagram Transport Layer Security - протокол, испозуемый для шифрования потоков

https://habr.com/ru/company/yandex/blog/419951/

# Connection

In order to establish a WebRTC communication, peers engage in an SDP negotiation process, where one of the peers (the offerer) sends an offer, while the other peer (the offeree) responds with an answer

https://doc-kurento.readthedocs.io/en/6.11.0/_static/client-jsdoc/module-elements.WebRtcEndpoint.html

WebRTC устанавливает UDP-соединения напрямую

# Отладка

`chrome://webrtc-internals/`

https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/iceConnectionState

# Процесс

https://developer.mozilla.org/en-US/docs/Web/API/WebRTC_API/Signaling_and_video_calling

## Диаграмы

[Signaling (SDP offer/answer exchange)](https://mdn.mozillademos.org/files/12363/WebRTC%20-%20Signaling%20Diagram.svg)
[Candidate exchange](https://mdn.mozillademos.org/files/12365/WebRTC%20-%20ICE%20Candidate%20Exchange.svg)

