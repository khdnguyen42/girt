#!/bin/dash

if test -e .girt
then
    rm -r .girt
fi

output1=$(./girt-add)
output2=$(./girt-commit)
output3=$(./girt-log)
output4=$(./girt-show)
output5=$(./girt-rm)
output6=$(./girt-status)

if test "$output1" = "girt-add: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[1]: girt-add behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[1]: girt-add behaviour for missing repo un-successful."
fi

if test "$output2" = "girt-commit: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[2]: girt-commit behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[2]: girt-commit behaviour for missing repo un-successful."
fi

if test "$output3" = "girt-log: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[3]: girt-log behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[3]: girt-log behaviour for missing repo un-successful."
fi

if test "$output4" = "girt-show: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[4]: girt-show behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[4]: girt-show behaviour for missing repo un-successful."
fi

if test "$output5" = "girt-rm: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[5]: girt-rm behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[5]: girt-rm behaviour for missing repo un-successful."
fi

if test "$output6" = "girt-status: error: girt repository directory .girt not found"
then
    echo ""
    echo "ah-pass[6]: girt-status behaviour for missing repo successful."
else
    echo ""
    echo "ah-fail[6]: girt-status behaviour for missing repo un-successful."
fi