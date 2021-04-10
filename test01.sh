#!/bin/dash

if test -e .girt
then
    rm -r .girt
fi
./girt-init

echo Tom>tom
echo Jim >jim

./girt-add tom jim
./girt-commit -m "names are committed"
echo Jack >jack
echo Jill >jill

./girt-add jack jill
./girt-rm --cached  tom jack
./girt-commit -m "second names are committed"

output1=$(./girt-show 0:tom)
output2=$(./girt-show 1:tom)

if test $output1 = "Tom"
then
    echo ""
    echo "ah-pass[1]: Tom successfully handled."
else
    echo ""
    echo "ah-fail[1]: Tom handling failed."
fi

if test "$output2" = "girt-show: error: 'tom' not found in commit 1"
then
    echo ""
    echo "ah-pass[1]: Tom successfully handled."
else
    echo ""
    echo "ah-fail[1]: Tom handling failed."
fi

