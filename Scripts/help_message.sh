#!/bin/bash

show_help(){
    echo "Usage: $0 [options]"
    echo "options"
    echo "-h, --help        Display this help message"
}

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    show_help
    exit 0
fi