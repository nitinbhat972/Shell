#include<stdio.h>
#include<stdlib.h>
#include "/run/media/jokerop/0F5B0E910F5B0E91/Study/College/DSA in C/custom-libs/stack-lib/stackCustom.h"


int main(){
    stack s = malloc(sizeof(struct Stack));
    initilizeStack(s, 5);
    push(s, 10);
    push(s, 11);
    push(s, 12);

    showData(s);
    
    return 0;
}