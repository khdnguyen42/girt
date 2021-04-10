#!/bin/dash

if test -e .girt
then
    rm -r .girt
fi
if test -e lmao.txt
then
	rm lmao.txt
fi
./girt-init
touch lmao.txt
./girt-add lmao.txt
./girt-commit -am "lmao commit"
if ! test -e .girt/master/commits/0/lmao.txt
then
    echo ""
	echo "ah-error: lmao.txt commit failed."
else
    echo ""
    echo "ah-pass: lmao.txt successfully committed."
fi

