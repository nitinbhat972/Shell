#!/bin/bash

spinner()
{
    local pid=$1
    local delay=0.2
    local spinstr='|/-\'
    while ps -p "$pid" > /dev/null; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf " [\033[32m\u2714\033[0m]  \n"  # Print a green tick after task completes
}

# Example usage:
# long_running_command &
spinner 14692