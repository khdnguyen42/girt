#!/bin/dash

# Basic girt command setup

if test -e .girt
then
    rm -r .girt
fi

output1=$(./girt-init)
touch me
./girt-add me
output2=$(./girt-commit -m "on facebook")
output3=$(./girt-log)

if test "$output1" = "Initialized empty girt repository in .girt"
then
    echo ""
    echo "ah-pass[1]: girt-init successful."
else
    echo ""
    echo "ah-fail[1]: girt-init unsuccessful."
fi

if test "$output2" = "Committed as commit 0"
then
    echo ""
    echo "ah-pass[2]: girt-commit successful."
else
    echo ""
    echo "ah-fail[2]: girt-commit unsuccessful."
fi

if test "$output3" = "0 on facebook"
then
    echo ""
    echo "ah-pass[3]: girt-log successful."
else
    echo ""
    echo "ah-fail[3]: girt-log unsuccessful."
fi