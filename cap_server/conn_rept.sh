#!/bin/bash

#while true; do cat key_test4.txt | nc -i 2 201.7.198.39 1300;done
#sh conn_rept.sh 5 key_test4.txt 1 201.7.198.39 1300

echo "usar conn_rept.sh <numero_repeticoes> <key_arquivo> <segundos> <IP> <porta>"

count=1
while [ $count -le $1 ]; do 
	cat $2 | nc -v -i $3 $4 $5;
	#echo "Teste numero " $count
	count=$(echo $count + 1 | bc)
done

