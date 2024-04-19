#!/bin/bash

green="\e[32m"
red="\e[31m"
blue="\e[34m"
reset="\e[0m"

while true; do
    clear
    echo -e "$blue$(date +%T)$reset"
    # echo -e "\e[31m$(date +%T)\e[0m"
    sleep 1
done