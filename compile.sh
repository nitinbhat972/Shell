#!/bin/bash

show_help(){
    echo "Usage: $0 /path/to/file_name.c"
    echo "Example: "
    echo "./compile.sh demo.c"
}

if [[ $# -eq 0 ]]; then
    show_help

elif [[ $# -eq 1 ]]; then
    gcc "$1"

elif [[ $# -eq 2 ]]; then
    gcc "$1" "$2"

else
    echo "Please enter at most 2 file"
fi

if make; then
    ./a.out

else
    echo "Compilation Failed"
fi

# if [[ $? -eq 0 ]]; then
#     ./a.out

# else
#     echo "Compilation Failed"

# fi