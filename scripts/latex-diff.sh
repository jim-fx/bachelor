#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

# File to be compared
file="$1"

if [ "$CI" == "true" ]; then
  git config --global --add safe.directory "*"
fi

# Use git show to get the content of the previous version and save it to file-old
git show HEAD^:"$file.tex" > "old-$file.tex"

# Generate the latexdiff
latexdiff "old-$file.tex" "$file.tex" --flatten > "diff-$file.tex"

biber "diff-$file"
make pdf FILE="diff-$file"

mv diff-"$file".pdf "$file"-diff.pdf

# Clean up temporary files
rm old-$file.tex diff-$file.tex

echo "Latex-diff complete. Output saved to $file-diff.pdf."

