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

# Find the SHA of the last commit with the commit message containing "release"
last_release_commit=$(git log --grep="release" -n 2 --format="%H" | tail -n 1)

# If no commit with "release" in the message is found, set it to the previous commit
if [ -z "$last_release_commit" ]; then
    last_release_commit=$(git log -n 2 --skip=1 --format="%H")
fi

# Use git show to get the content of the previous version and save it to file-old
git show "$last_release_commit":"$file.tex" > "old-$file.tex"

mv common.tex common.tex.bak
git show "$last_release_commit":"common.tex" > "common.tex"

# Generate the latexdiff
latexdiff "old-$file.tex" "$file.tex" --flatten > "diff-$file.tex"

make pdf FILE="diff-$file"

rm -rf common.tex
mv common.tex.bak common.tex

mv "diff-$file.pdf" "$file-diff.pdf"

# Clean up temporary files
rm "old-$file.tex" "diff-$file.tex"

echo "Latex-diff complete. Output saved to $file-diff.pdf."
