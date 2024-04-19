#!/bin/sh

ziping(){
    local name
    local size
    local time
    read -rp "Enter the name/type of the files you want to compress( case sensitive ): " name
    read -rp "Enter the size of the files you wan to compress( in M, G, k, c ): " size
    size="${size^^}"
    read -rp "Enter the day of file you want to compress( in days ): " time
    
    local path="$1"
    local archive_path="$path/Archiver"
    
    depth=1
    mapfile -t files < <(find "$path" -maxdepth "$depth" -type f \( -size +"$size" -o -mtime -"$time" \) -name "*$name*" -not -name "$(basename "$0")")

    if [[ ! -d "$path" ]]; then
        echo -e "\e[31mError: $path does not exists\e[0m"
        exit 1
    fi

    if [[ ! -d "$archive_path" ]]; then
        mkdir "$archive_path"
    fi

    echo "--------------------------------------"

    if [[ "${#files}" -gt 0 ]]; then
        for i in "${files[@]}"; do
        echo -e "\e[35mgziping:  $i\e[0m"
            gzip "$i" || { echo -e "\e[31mError: gzip of $i failed"; exit 1; }
            mv "$i".gz "$path"/Archiver || { echo -e "\e[31mError: moving of $i.gz failed\e[0m"; exit 1; }
        done
    else
        echo -e "\e[31m$path does not exists"
    fi
    echo "--------------------------------------"
}

gunziping(){
    local path="$1"
    local archive_path="$path/Archiver"

    echo "--------------------------------------"

    if [[ -d "$archive_path" ]]; then
        for i in "$archive_path"/*; do
            echo -e "\e[35mgunziping :  $i\e[0m"
            if [[ "$i" == *.gz ]]; then
                gunzip "$i" || { echo -e "\e[31mError: ungzip of $i failed\e[0m"; exit 1; }
            fi
        done
        
        echo "--------------------------------------"

        for i in "$archive_path"/*; do
            echo -e "\e[35mMoving:  $i to $archive_path\e[0m"
            mv "$i" "$path" &>/dev/null
        done

        echo "--------------------------------------"
        echo -e "\e[35mRemoving: $archive_path\e[0m"
        rm -rf "$archive_path"

        echo "--------------------------------------"
        echo -e "\e[35mRemoved succefully: $archive_path\e[0m"
    else
        echo -e "\e[31mThe $archive_path does not exist\e[0m"
    fi
    echo "--------------------------------------"
}

main(){
    if [[ "$#" -eq 0 ]]; then
        echo -e "\e[31mNo command option provided\e[0m"
        echo -e "\e[33mUsage: $0 [ -z | --gzip | -uz | --gunzip | -h | --help ]\e[0m"
        exit 1
    fi
    
    case "$1" in
        "-z" | "--gzip")
            if [[ -n "$2" ]]; then
                ziping "$2"
            else
                read -rp "Enter the path: " path
                ziping "$path"
            fi
            ;;
        "-uz" | "--ungzip")
            if [[ -n "$2" ]]; then
                gunziping "$2"
            else
                read -rp "Enter the path: " path
                gunziping "$path"
            fi
            ;;
        "-h" | "--help")
            if [[ "$2" == "-z" || $2 == --gzip ]]; then
                echo -e "\e[33mUsage: $0 [ -z | --gzip ] <path>\e[0m"
                exit 1
            
            elif [[ "$2" == -uz || "$2" == --ungzip ]]; then
                echo -e "\e[33mUsage: $0 [ -uz | --gunzip ] <path>\e[0m"
        
            else 
                echo -e "\e[33mUsage: $0 [ -z | --gzip | -uz | --gunzip ] [ options ]\e[0m"   
                echo -e "\e[33m-z, --gzip: Compress files\e[0m"
                echo -e "\e[33m-uz, --gunzip: Decompress files\e[0m"
                echo -e "\e[33m-h, --help: Display this help message\e[0m"
            fi
            exit 0
            ;;
        *)
            echo -e "\e[31$1 is not a valid command"
            echo -e "\e[33mUsage: $0 [ -z | --gzip | -uz | --gunzip | -h | --help ]\e[0m"
            exit 1
            ;;
    esac
}

main "$@"
