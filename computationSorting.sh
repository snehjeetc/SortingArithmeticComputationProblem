#!/bin/bash -x

declare -i a=0
declare -i b=0
declare -i c=0
declare -i res1=0
declare -i res2=0
declare -i res3=0
declare -i res4=0

TakeInput(){
    read -p "Enter three numbers : " a b c
}


compute(){
    res1=$(($a+$b*$c))
    res2=$(($a*$b+$c))
    if [ $b -eq 0 ]
    then
        echo "Error Divide by zero"
        exit -1
    fi
    res3=$(($c+($a/$b)))
    res4=$(($a%$b + $c))
}


echo "This problem computes different arithmetic expressions and Sorts the results"
TakeInput
compute
