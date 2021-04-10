#!/bin/dash

if test -e .girt
then
    rm -r .girt
fi

./girt-init

output1=$(./girt-init)
touch b
output2=$(./girt-add a)
./girt-add b
./girt-commit -m "yeet 1"
output3=$(./girt-rm a)
./girt-rm b
./girt-commit -m "yeet 2"
output4=$(./girt-commit -m "yeet 3")

if test "$output1" = "girt-init: error: .girt already exists"
then
    echo ""
    echo "ah-pass[1]: girt-init output correct."
else
    echo ""
    echo "ah-fail[1]: girt-init output incorrect."
fi

if test "$output2" = "girt-add: error: can not open 'a'"
then
    echo ""
    echo "ah-pass[2]: girt-add output correct."
else
    echo ""
    echo "ah-fail[2]: girt-add output incorrect."
fi

if test "$output3" = "girt-rm: error: 'a' is not in the girt repository"
then
    echo ""
    echo "ah-pass[3]: girt-rm output correct."
else
    echo ""
    echo "ah-fail[3]: girt-rm output incorrect."
fi


if test "$output4" = "nothing to commit"
then
    echo ""
    echo "ah-pass[4]: girt-commit output correct."
else
    echo ""
    echo "ah-fail[4]: girt-commit output incorrect."
fi
