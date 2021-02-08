#!/bin/bash -x

declare -i a=0
declare -i b=0
declare -i c=0
declare -A results
declare -i key=0

storeInDictionary(){
    results[$key]=$1
    ((key++))
}

TakeInput(){
    read -p "Enter three numbers : " a b c
}


compute(){
    res1=$(($a+$b*$c))
    storeInDictionary $res1
    res2=$(($a*$b+$c))
    storeInDictionary $res2
    if [ $b -eq 0 ]
    then
        echo "Error Divide by zero"
        exit -1
    fi
    res3=$(($c+($a/$b)))
    storeInDictionary $res3
    res4=$(($a%$b + $c))
    storeInDictionary $res4
}


echo "This problem computes different arithmetic expressions and Sorts the results"
TakeInput
compute
