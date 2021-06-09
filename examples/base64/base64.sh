#!/bin/bash
cat $0|tail -c 312|base64 -d > "2b108948e6.tar.gz"
if [ "$(sha256sum 2b108948e6.tar.gz|head -c 64)" != "56b44be72d9bbdc6bda18dad95272864d4771f73afe1de243ece7c242588baa3" ];then
        echo "56b44be72d9bbdc6bda18dad95272864d4771f73afe1de243ece7c242588baa3 != $(sha256sum 2b108948e6.tar.gz|head -c 64)"
        exit
fi
yes|tar xpzf "2b108948e6.tar.gz"
old_dir="$PWD"
./t/1
cd "$old_dir"
rm "2b108948e6.tar.gz"
rm 't/'  -rf
exit
H4sIAAAAAAAAA+3WXQuCMBQG4F37Kwbdu/Mx588JsaC7oPT/N40ijBgIW1/vczNBYWOvZ2e1G5zJjKKWKI6igR/HO8OeJKgXYjbEpKrGNrkXNhnPQ3ey1oy07Vjo9XeJ91+qjvlz5jmS+etT/p7F2CKb/ef57/vD0XLV7+zgxFWb+CBV7eTd64IypvqXzB1gxfnvW4/zv4Rr/pr1D1iRf9CA/Eu45a8Z50jnH5b5t4L+X8Tc/3OGDx/tWv95r3vJ+ud2Wf9NYNR/CXP9y3T/13jtx0EAAAAAAAAAAAAAAPALLnJBQoUAKAAA