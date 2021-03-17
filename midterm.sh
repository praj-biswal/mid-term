#!/bin/bash

# assign variables
ACTION=${1}

function delete_file(){
rm "${1}-server.txt"
}

function create_file() {
touch "${1}-server.txt"
}

function list_file(){
ls *.txt
}

function display_help() {

cat << EOF
Usage: ${0} {-c|--create|-h|--help|-d|--delete|-ls|--listfile} <filename>
OPTIONS:
       -c | --create Create a new file
       -h | --help Display the command help
       -ls| --listfile List all .txt files
       -d | --delete It deletes the file
Examples:
        Create a new file:
               $ ${0} -c foo.txt
        Display help:
               $ ${0} -h
	List all files:
	       $ ${0} -ls
        Delete file:
               $ ${0} -d	
EOF
}

case "$ACTION" in
        -ls|--listfile)
                list_file
                ;;
        -c|--create)
                create_file "${2:-server.txt}"
                ;;
	-h|--help)
		display_help
		;;
	-d|--delete)
		delete_file "${2:-server.txt}"
		;;
         *)
         echo "Usage ${0} {-c|-h|-ls|-d}"
         exit 1
esac

