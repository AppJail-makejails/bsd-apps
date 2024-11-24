# bsd-apps

Collection of scripts to install popular applications inside FreeBSD jails, or FreeBSD host system.

github.com/tschettervictor/bsd-apps

## How to use this Makejail

Each application has a README in its directory. Read it to see if you need to mount a directory to preserve your data and/or to see which application needs a `jail(8)` parameter (which means you must create a template and set `-o template="path/to/your/template.conf"`).

**Example**:

```console
$ mkdir -p .volumes/uptime-kuma/data
$ appjail makejail \
    -j uptime-kuma \
    -f gh+AppJail-makejails/bsd-apps \
    -V BSD_APP=uptime-kuma \
    -o virtualnet=":<random> default" \
    -o nat \
    -o fstab="$PWD/.volumes/uptime-kuma/data /mnt/data"
...
Installation Complete!
Uptime-Kuma is running on port 3001
```

**Note**: You can pass other environment variables using the `-V` parameter depending on whether the application needs more.

## Environment

* `BSD_APP` (mandatory): Application to install.
