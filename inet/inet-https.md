# Internet: HTTPS

## Symmetric and asymmetric encryption

- :newspaper: [Symmetric and asymmetric encryption explained: RSA vs. AES](https://preyproject.com/blog/types-of-encryption-symmetric-or-asymmetric-rsa-or-aes)

Symmetric encryption involves using a single key to encrypt and decrypt data, while asymmetric encryption (also known as public key cryptography) uses two keys - one public and one private - to encrypt and decrypt data.

Symmetric Encryption algorithms - AES, DES, Blowfish.
Asymmetric Encryption algorithms - RSA, ECC, DSA.

## HTTPS uses Asymmetric or Symmetric encryption?

:speech_balloon: [HTTPS uses Asymmetric or Symmetric encryption? | SO](https://stackoverflow.com/questions/37791013/https-uses-asymmetric-or-symmetric-encryption)

The best answer is that it does both. TLS uses asymmetric encryption to first establish the identity of one or both parties. Secondly, it uses asymmetric encryption to exchange a key to a symmetric cipher. So asymmetric is only used during the initial setup of communication.

Symmetric encryption which is used through the rest is faster and more efficient with large amounts of data transfer. The keys are smaller which is generally why it's faster, but its algorithm is also easier to process.

:newspaper: [Symmetric and asymmetric encryption explained: RSA vs. AES](https://preyproject.com/blog/types-of-encryption-symmetric-or-asymmetric-rsa-or-aes)

1. Your browser uses asymmetric encryption (RSA or ECDHE) to securely exchange a symmetric key with the server.
2. That key is then used for AES-based session encryption, keeping your data private as you browse.

This hybrid model—asymmetric key exchange + symmetric encryption—is now the backbone of all secure web communication.

- :newspaper: [HTTPS: How HTTPS Works - Handshake - DEV Community](https://dev.to/zeeshanali0704/https-how-https-works-handshake-1mjo)

- The client generates a pre-master secret key and encrypts it using the server's public key, then sends it to the server.
- Both the client and the server use the pre-master secret and the random numbers to generate the session keys, which are symmetric keys used for encrypting the data during the session.
- The client sends a "Change Cipher Spec" message to indicate that subsequent messages will be encrypted with the session key.
- The client sends a "Finished" message, encrypted with the session key, to indicate that the client part of the handshake is complete.
- The server sends a "Change Cipher Spec" message to indicate that subsequent messages will be encrypted with the session key.
- The server sends a "Finished" message, encrypted with the session key, to indicate that the server part of the handshake is complete.

