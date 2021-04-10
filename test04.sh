#!/bin/dash

# tests for log and status

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
output1=$(../girt-log)
touch tom
echo "bob" > c.txt
output2=$(../girt-status)

if test "$output1" = "0 add c.txt"
then
    echo ""
    echo "ah-pass[1]: girt-log output correct."
else
    echo ""
    echo "ah-fail[1]: girt-log output incorrect."
fi
if test "$output2" = "c.txt - file changed, changes not staged for commit
tom - untracked"
then
    echo ""
    echo "ah-pass[2]: girt-status output correct."
else
    echo ""
    echo "ah-fail[2]: girt-status output incorrect."
fi

rm -r ../testing