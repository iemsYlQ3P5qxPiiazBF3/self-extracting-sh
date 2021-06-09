```
directories:

because sez generated scripts unpack in the current directory, if you are packing just 1 directory, you need to do 1 of 2 things:

1. add `cd [directory]/` when generating,
or:
2. modify source scripts to execute `[directory]/[file]`

otherwise, the generated script will complain of a missing directory, since it's trying to execute something in [dir1] but the files to execute are in `[dir1]/[dir2]`
```