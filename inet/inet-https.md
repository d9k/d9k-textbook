# Internet: HTTPS

## HTTPS uses Asymmetric or Symmetric encryption?

- :speech_balloon: [HTTPS uses Asymmetric or Symmetric encryption? | SO](https://stackoverflow.com/questions/37791013/https-uses-asymmetric-or-symmetric-encryption)

The best answer is that it does both. TLS uses asymmetric encryption to first establish the identity of one or both parties. Secondly, it uses asymmetric encryption to exchange a key to a symmetric cipher. So asymmetric is only used during the initial setup of communication.

Symmetric encryption which is used through the rest is faster and more efficient with large amounts of data transfer. The keys are smaller which is generally why it's faster, but its algorithm is also easier to process.