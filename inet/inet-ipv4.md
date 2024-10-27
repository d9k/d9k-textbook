# Internet: IPv4

Internet Protocol Version 4

## What does /24, /16 subnet mask mean?

- [What does a /24 mean in an IP address? | Quora](https://www.quora.com/What-does-a-24-mean-in-an-IP-address)

The `/24` is a shorthand way of expressing the subnet mask `255.255.255.0`. This means:

- The first three octets (24 bits) are set to `255` (binary `11111111.11111111.11111111.00000000`), indicating they are part of the network.
- The last octet (8 bits) is set to `0`, indicating that it can be used for host addresses.
- A `/24` subnet can accommodate up to 256 IP addresses (from `192.168.1.0` to `192.168.1.255`), but typically 2 addresses are reserved (one for the network address and one for the broadcast address), leaving 254 usable addresses for hosts.