#!/bin/bash
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
tarhash=$(sha256sum "$tarname.tar.gz"|head -c 64)
sig=$(echo "$tarhash"|gpg --sign --armor)
rm -rf ${dirname:?}/
echo "#!$SHELL
cat \$0|tail -c $(wc -c < "$tarname".tar.gz) > \"$tarname.tar.gz\"
echo \"$sig\"|gpg --decrypt
echo \"(\$(sha256sum $tarname.tar.gz|head -c 64))\"
read -erp \"continue [y/n]: \" continue
[ \"\$continue\" == \"y\" ]&&:||exit
if [ \"\$(sha256sum $tarname.tar.gz|head -c 64)\" != \"$tarhash\" ];then
        echo \"$tarhash != \$(sha256sum $tarname.tar.gz|head -c 64)\"
        exit 1
fi
yes|tar xpzf \"$tarname.tar.gz\"
old_dir=\"\$PWD\"
$cmd
cd \"\$old_dir\"
rm \"$tarname.tar.gz\"
rm $(printf "'%s' " "${@}") -rf
exit">"$tarname.sh"
cat "$tarname".tar.gz>>"$tarname.sh"
rm "$tarname".tar.gz
chmod +x "$tarname.sh"
ls "$tarname.sh"