#!/bin/bash
cat $0|tail -c 146 > "956a09a61f.tar.gz"
echo "-----BEGIN PGP MESSAGE-----

owEBDgLx/ZANAwAKAfmcr08LL320ActHYgBgiqoZZjczZDBhNmJmOWIzMTI5OWYz
ZDc3ZDJlMGYxNjYzNWQ3ZjRkNTlhYzhjMTZjMDM5MGQyNzEwYmVmODI5ZjFmNAqJ
AbMEAAEKAB0WIQQiYk634ce2RJAnNdX5nK9PCy99tAUCYIqqGQAKCRD5nK9PCy99
tHw8DAC2xeSQVDW85ryqr3GqoEsbdbkCsVVOdiOvsK98IpERh2Nxzelq7JOBt7oj
R87/BBKqQxJVPgfaOFIxNK8WiUrQVAKjXnkihJkBMSBmvwjngmfNTDmIL+zP966O
jO6my91bFaXzbocznJYt77eFx/QkuwwaM1+QOJas0MmNcO7iC/9XqfKoTKNhXyNP
7FfOFV9rWLEtKx54pIb3PZaKJ0nnyKRsHky8EKxrtqHOI8xys916UexdXS5Bi+O9
tAC2KgVBD1KxRuGocK6OWrb5qukSRMUtNtjOV9677WohHqxqsDkzDexZtaCarGo8
rwDxngzvcYMtjVju+wCLD9MKPDQXeLMF0lqFj0KIpMo3pd7UGeVhD9QBJNGL3nfS
jNmPjrtn6k/4irSpXl29LqLVbi08qNF/3USvNhyZHJVEOVOn8Rm9VeAFUEHZkZDh
CCSoscTahhea3AM3jGgqqWr5tWBNwPtBjvTx+VGQaVPzo32ro+XfsYlQpEYlvC+D
XzjbnkM=
=v/Dg
-----END PGP MESSAGE-----"|gpg --decrypt
echo "($(sha256sum 956a09a61f.tar.gz|head -c 64))"
read -erp "continue [y/n]: " continue
[ "$continue" == "y" ]&&:||exit
if [ "$(sha256sum 956a09a61f.tar.gz|head -c 64)" != "f73d0a6bf9b31299f3d77d2e0f16635d7f4d59ac8c16c0390d2710bef829f1f4" ];then
        echo "f73d0a6bf9b31299f3d77d2e0f16635d7f4d59ac8c16c0390d2710bef829f1f4 != $(sha256sum 956a09a61f.tar.gz|head -c 64)"
        exit 1
fi
yes|tar xpzf "956a09a61f.tar.gz"
old_dir="$PWD"
cat signed
cd "$old_dir"
rm "956a09a61f.tar.gz"
rm 'signed'  -rf
exit
�      ��A
�@��9JN�&Ӧs��R\Te��wD
�F\���̓l��5m�N�����\�s��>zt���+!^�Z��2f�o�ڢ�]�q������6�쟺�A�f�՟��X_��4�q�u             ��1 � (  