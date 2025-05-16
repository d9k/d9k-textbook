# Security: hash

## Birthday Attacks, Collisions, And Password Strength

- https://auth0.com/blog/birthday-attacks-collisions-and-password-strength/

Only 23 required in room to have 50% chance for at least 1 collision of their birthdays!

What If 1234 Is Mapped To The Same Hash As My Strong Password? You’re not worried if there are hash collisions in general, but _if there are other hashes colliding with the hash value of your password_. You need 253 people in the room to have 50% chance of sharing birthday with _you_.

if the hashing function is MD5, the attacker would have to go through 2^(127.5) hashes to have a >50% chance of finding a hash that collides with yours, which is more than the theoretical 2^127 operations to brute-force the entire sample space.

This means that the likelihood of 1234 colliding specifically with yours is less likely to happen than the attacker just guessing your password out of all 2^128 possibilities.

Also collision may be 300 characters long (length restriction by the server may be 100 characters).

Preimage resistance: given a hash value, how hard is it to revert it to the original message?

Most of the time, it’s a better deal for the attacker to try to guess the password because the sample space is almost always smaller since humans aren’t very good at picking \[unique short\] passwords.

.....


