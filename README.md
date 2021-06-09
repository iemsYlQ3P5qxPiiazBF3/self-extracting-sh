```
Self-Extracting-Sh info/warnings:

has sha256 hash checking (unencrypted only)

if executed files have an infinite loop in them, files will be left behind

only scripts generated with `sez_base64.sh` can have shc used on them, otherwise shc removes the data

sez_encrypt.sh uses base64 because otherwise it doesn't work. i don't know why.

all files are set executable just for convenience

directories are weird with these, so use `cd [directory]/` when generating

generated scripts have the shebang of the current shell, so if a script is generated on termux it will show `#!/data/data/com.termux/files/usr/bin/bash`, on desktop, `#!/bin/bash`
```

(also, files are called `sez` because this was originally a self extracting zip)
