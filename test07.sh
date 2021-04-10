#!/bin/dash

if test -e .girt
then
    rm -r .girt
fi

mkdir testing
cd testing

../girt-init

echo "jim" > c.txt
../girt-add c.txt
../girt-commit -am "add c.txt"
touch tom
echo "bob" > a.txt
../girt-add tom
../girt-add a.txt
../girt-rm --cached a.txt
output1=$(../girt-status)
echo "$output1"

if test "$output1" = "a.txt - untracked
c.txt - same as repo
tom - added to index"
then
    echo ""
    echo "ah-pass: girt-status output correct."
else
    echo ""
    echo "ah-fail: girt-status output correct."
fi
rm -r ../testing