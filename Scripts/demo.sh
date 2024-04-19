#!/bin/bash

progress_bar() {
    local duration=$1
    local char_width=60
    local progress=0
    local sleep_duration=$((duration / char_width))
    
    printf '['
    while [ $progress -lt $char_width ]; do
        printf '#'
        ((progress++))
        sleep $sleep_duration
    done
    printf ']\n'
}

# Example usage:
progress_bar 100  # Display a progress bar for 10 seconds
