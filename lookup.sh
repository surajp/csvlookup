#!/bin/bash

if [ $# -ne 8 ]
then
	echo "arg1 = lookup file"
	echo "arg2 = data file"
	echo "arg3 = column name or number of lookup data in lookup file"
	echo "arg4 = column name or number of lookup data in data file"
	echo "arg5 = column name or number of data to fetch from lookup file"
	echo "arg6 = file name of output file with matches found"
	echo "arg7 = file name of output file wiih no matches"
	echo "arg8 = name of new column in the output file"
	exit 1
fi
./processcsv.sh $1
./processcsv.sh $2
awk -v C1="$3" -v C2="$4" -v C3="$5" -v C4="$6" -v C5="$7" -v C6="$8" -f vlookup.awk $1"_op" $2"_op"
rm $1"_op" $2"_op"
wc -l $6
wc -l $7
