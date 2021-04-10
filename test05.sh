#!/bin/dash

# girt-rm test cases

if test -e .girt
then
    rm -r .girt
fi

./girt-init
touch 1
./girt-add 1
output1=$(./girt-rm 1)
rm 1
touch 2
output2=$(./girt-rm --cached 2)
./girt-add 2
output3=$(./girt-rm 2)
./girt-add 2
./girt-commit -am "commit b"
./girt-rm --force 2

if test "$output1" = "girt-rm: error: '1' has staged changes in the index"
then
    echo ""
    echo "ah-pass[1]: girt-rm behaviour successful."
else
    echo ""
    echo "ah-fail[1]: girt-rm behaviour un-successful."
fi

if test "$output2" = "girt-rm: error: '2' is not in the girt repository"
then
    echo ""
    echo "ah-pass[2]: girt-rm behaviour successful."
else
    echo ""
    echo "ah-fail[2]: girt-rm behaviour un-successful."
fi

if test "$output3" = "girt-rm: error: '2' has staged changes in the index"
then
    echo ""
    echo "ah-pass[3]: girt-rm behaviour successful."
else
    echo ""
    echo "ah-fail[3]: girt-rm behaviour un-successful."
fi