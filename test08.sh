#!/bin/dash

# testing rm add

if test -e .girt
then
    rm -r .girt
fi

mkdir testing
cd testing

../girt-init

touch apple
../girt-add apple
../girt-commit -m "apple commit"
rm apple
../girt-add apple
output=$(../girt-commit -m "no apple commit")
echo "$output"

if test "$output" = "Committed as commit 1"
then
    echo ""
    echo "ah-pass: girt-add & girt-commit for removed items are correct."
else
    echo ""
    echo "ah-fail: girt-add & girt-commit for removed items are incorrect."
fi

rm -r ../testing