#!/bin/bash -x

declare -i a=0
declare -i b=0
declare -i c=0
declare -A results
declare -a array
declare -i key=0

storeInDictionary(){
    results[$key]=$1
    ((key++))
}

storeInArray(){
    for keys in ${!results[@]}
    do 
       array[$keys]=${results[$keys]} 
    done
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

showInDescendingOrder(){
    tempArray=()
    for index in ${!array[@]}
    do
        tempArray[$index]=${array[$index]}
    done
    for((i=0; i<${#tempArray[@]}; i++))
    do
        index=$i
        max=${tempArray[$i]}
        for((j=$(($i+1)); j<$((${#tempArray[@]}-1)); j++))
        do
            if [ $max -lt ${tempArray[$j]} ]
            then
                max=${tempArray[$j]}
                index=$j
            fi
        done
        temp=${tempArray[$i]}
        tempArray[$i]=${tempArray[$index]}
        tempArray[$index]=$temp
    done
    for i in ${!tempArray[@]}
    do
        echo ${tempArray[$i]}
    done
    unset tempArray
}


echo "This problem computes different arithmetic expressions and Sorts the results"
TakeInput
compute
storeInArray
showInDescendingOrder
