#!/bin/dash

# Commit spam / commit tracking / rm behaviour
if test -e .girt
then
    rm -r .girt
fi
./girt-init

success1=0
success2=0

touch 1 2
./girt-add 1 2
./girt-commit -m "1st commit"
rm 1
./girt-commit -m "2nd commit"
./girt-add 1
./girt-commit -m "2nd commit"
./girt-rm --cached 2
./girt-commit -m "2nd commit"

output1=$(./girt-rm 2)
if test "$output1" = "girt-rm: error: '2' is not in the girt repository"
then
    success1=1
fi
./girt-add 2
output2=$(./girt-rm 2)
if test "$output2" = "girt-rm: error: '2' has staged changes in the index"
then
    success2=1
fi
./girt-commit -m "3rd commit"
./girt-rm 2
./girt-commit -m "4th commit"

if test $success1 -eq 1 && test $success2 -eq 1
then
    echo ""
    echo "ah-pass[1]: girt-rm successfully handled for non-existing removes."
    echo ""
    echo "ah-pass[2]: girt-rm successfully handled for staged changes."
elif test $success1 -eq 1 && ! test $success2 -eq 1
then
    echo ""
    echo "ah-pass[1]: girt-rm successfully handled for non-existing removes."
    echo ""
    echo "ah-fail[2]: girt-rm un-successfully handled for staged changes."
elif ! test $success1 -eq 1 && test $success2 -eq 1
then
    echo ""
    echo "ah-fail[1]: girt-rm un-successfully handled for non-existing removes."
    echo ""
    echo "ah-pass[2]: girt-rm successfully handled for staged changes."
else
    echo ""
    echo "ah-fail[1]: girt-rm un-successfully handled for non-existing removes."
    echo ""
    echo "ah-fail[2]: girt-rm un-successfully handled for staged changes."
fi