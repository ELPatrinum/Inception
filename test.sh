#!/bin/bash

# Check if the user provided the search and replace words
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <search_word> <replace_word>"
    exit 1
fi

# Assign the search and replace words to variables
search_word=$1
replace_word=$2

# Use find to locate all files in the current directory and subdirectories
# Then use sed to replace the search word with the replace word in each file
find . -type f -exec sed -i "s/$search_word/$replace_word/g" {} +

echo "Replaced '$search_word' with '$replace_word' in all files."
