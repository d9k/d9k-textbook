/var/cache/apt/archives directory in the host system. I did these steps:

1. Created /opt/repo directory (could be the home directory)
2. Created the directory /opt/repo/binary (copied from Debian specs)
3. Copied all debs from my update from /var/cache/apt/archives to /opt/repo/binary
4. Executed dpkg-scanpackages like this:
# pwd
/opt/repo
# dpkg-scanpackages binary /dev/null | gzip -9c > binary/Packages.gz