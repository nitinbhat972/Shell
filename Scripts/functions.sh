#!/bin/bash

function f1 {
    echo "This is first function"
}

f2(){
    echo "This is second function"
}

sum() {
    local sum=$(($1 + $2))
    echo $sum
}

f1
f2

sum 1 2