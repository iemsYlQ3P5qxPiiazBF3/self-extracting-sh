#!/bin/bash
read -erp "recipient ID: " rec
cmd="$(cat)"
tarname="$(xxd -l 5 -p < /dev/urandom)"
dirname="$RANDOM"
mkdir "$dirname"
for i in "${@}";do
        cp -R "$i" "$dirname/$i"
done
cd "$dirname"||exit
chmod -R +x .
tar --numeric-owner -cpzf "$tarname.tar.gz" .
mv "$tarname.tar.gz" ../
cd ..
base64 "$tarname.tar.gz"|gpg --encrypt -r "$rec" > "$tarname".tmp
mv "$tarname.tmp" "$tarname.tar.gz"
rm -rf ${dirname:?}/
echo "#!$SHELL
cat \$0|tail -c $(wc -c < "$tarname".tar.gz)|gpg --decrypt|base64 -d > \"$tarname.tar.gz\"
yes|tar xpzf \"$tarname.tar.gz\"
old_dir=\"\$PWD\"
$cmd
cd \"\$old_dir\"
rm \"$tarname.tar.gz\"
rm $(printf "'%s' " "${@}") -rf
exit">"$tarname.sh"
cat "$tarname".tar.gz>>"$tarname.sh"
rm "$tarname.tar.gz"
chmod +x "$tarname.sh"
ls "$tarname.sh"