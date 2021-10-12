#!/bin/bash

PIPEXPATH="../pipex"

TESTPATH="../pipexfasttest"
OUTPATH="../pipexfasttest/outs"

cd $PIPEXPATH && make

cd $PIPEXPATH && ./pipex $TESTPATH/infile "ls -l" "wc -l" $OUTPATH/out1
cd $PIPEXPATH && ./pipex $TESTPATH/infile "grep a" "wc -w" $OUTPATH/out2
cd $PIPEXPATH && ./pipex $TESTPATH/infile "ls -slslksdfow" "wc -cmlw" $OUTPATH/out3
cd $PIPEXPATH && ./pipex $TESTPATH/infile "grep -i North" "echo Star" $OUTPATH/out4
cd $PIPEXPATH && ./pipex $TESTPATH/infile "who -b" "grep -v Reprogramme" $OUTPATH/out5

echo -------------------------------------
echo Test1
echo Pipex out:
cat $OUTPATH/out1
echo System out:
< $TESTPATH/infile ls -l | wc -l
echo -------------------------------------

echo Test2
echo Pipex out:
cat $OUTPATH/out2
echo System out:
< $TESTPATH/infile grep a | wc -w
echo -------------------------------------

echo Test3
echo Pipex out:
cat $OUTPATH/out3
echo System out:
< $TESTPATH/infile ls -slslksdfow| wc -cmlw
echo -------------------------------------

echo Test4
echo Pipex out:
cat $OUTPATH/out4
echo System out:
< $TESTPATH/infile grep -i North | echo Star
echo -------------------------------------

echo Test5
echo Pipex out:
cat $OUTPATH/out5
echo System out:
< $TESTPATH/infile  who -b | grep -v Reprogramme
echo -------------------------------------
