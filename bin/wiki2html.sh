#!/bin/bash

# Source: https://gist.github.com/rattletat/4a1098d5c1e7c8db1fe52d4740076808
# This is heavily based on this code here:
# https://gist.github.com/maikeldotuk/54a91c21ed9623705fdce7bab2989742
# Which is heavily based on this code here:
# https://gist.github.com/enpassant/0496e3db19e32e110edca03647c36541
# Special thank you to the user enpassant for starting it https://github.com/enpassant

# ARGUMENT PARSING
# Do not overwrite (0) or overwrite (1)
OVERWRITE="$1"
# Syntax chosen for the wiki
SYNTAX="$2"
# File extension for the wiki
EXTENSION="$3"
# Full path of the output directory
OUTPUTDIR="$4"
# Full path of the wiki page
INPUT="$5"
# Full path of the css file for this wiki
CSSFILENAME=$(basename "$6")
# Full path to the wiki's template
TEMPLATE_PATH="$7"
# The default template name
TEMPLATE_DEFAULT="$8"
# The extension of template files
TEMPLATE_EXT="$9"
# Count of '../' for pages buried in subdirs
ROOT_PATH="${10}"

# If file is in vimwiki base dir, the root path is '-'
[[ "$ROOT_PATH" = "-" ]] && ROOT_PATH=''

# Example: index
FILE=$(basename "$INPUT")
# Example: index.md
FILENAME=$(basename "$INPUT" ."$EXTENSION")
# Example: /home/rattletat/wiki/text/uni/
FILEPATH=${INPUT%$FILE}
# Example: /home/rattletat/wiki/html/uni/index
OUTPUT=$OUTPUTDIR$FILENAME

# PANDOC ARGUMENTS

# Mathjax tutorial for markdown: https://yihui.org/en/2018/07/latex-math-markdown/
# If you have Mathjax locally use this:
MATHJAX="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.6/latest.js?config=TeX-AMS-MML_HTMLorMML"
# MATHJAX="/usr/share/mathjax/MathJax.js?config=TeX-AMS-MML_HTMLorMML"

# PREPANDOC PROCESSING AND PANDOC

# cd to output directory for pandoc filter resources images
cd "$OUTPUTDIR" || exit

pandoc_template="pandoc \
    --mathjax=$MATHJAX \
    --template=$TEMPLATE_PATH$TEMPLATE_DEFAULT$TEMPLATE_EXT \
    -f $SYNTAX \
    -t html \
    --toc \
    --filter=R-pandoc \
    --resource-path=$OUTPUTDIR
    --toc-depth=3 \
    -c $CSSFILENAME \
    -s \
    -M root_path:$ROOT_PATH"
# --filter=R-pandoc \
# --filter=diagrams-pandoc \

# Searches for markdown markdown anchor links and append .html after the filename
# Sample anchor link: [Some Text](filename#anchor-name)
regex1='s/(\[.+\])\(([^#)]+)(#[^.)]+)\)/\1(\2.html\3)/g'
# Searches for markdown links (without extension or .md) and appends a .html
regex2='s/(\[.+\])\(((\.\.\/)?([^.#)]+))(\.md|\))/\1(\2.html)/g'
# Removes placeholder title from vimwiki markdown file
regex3='s/^%title (.+)$/---\ntitle: \1\n---/'

pandoc_input=$(cat "$INPUT" | sed -r "$regex1;$regex2;$regex3")
pandoc_output=$(echo "$pandoc_input" | $pandoc_template)

# POSTPANDOC PROCESSING

# Removes "vfile" and "file" from ![pic of sharks](file:../sharks.jpg)
regex4='s/vfile://g'
regex5='s/file://g'

echo "$pandoc_output" | sed -r "$regex4" | sed -r "$regex5" > "$OUTPUT.html"
