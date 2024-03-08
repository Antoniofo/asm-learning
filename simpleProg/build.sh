#!/bin/sh
for file in src/*.s; do
    # Check if file exists and is a regular file
    if [ -f "$file" ]; then
        echo "Processing file: $file"
        fileW="$(basename "${file%.s}")"
        nasm -f elf64 -o obj/$fileW.o $file
        ld -o bin/$fileW obj/$fileW.o
        # Add your processing logic here
        # For example, you can print the content of each file:
        # cat "$file"
        # Or perform any other operation you want to do with the file
        echo "Done processing $file"
    fi
done
#nasm -f elf64 -o output.o $1
#ld -o output output.o
