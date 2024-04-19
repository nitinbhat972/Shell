#!/bin/awk -f

function sum(a, b){
    return a+b
}

BEGIN{
    print sum(1, 2)
}