#!/bin/bash

# Source configuration variables
source config.sh

# Initialize debug mode variable
debug=false

# Parse flags
while getopts "d" flag; do
  case "${flag}" in
    d) debug=true ;;
  esac
done

# Fetch the script and compute its hash once
script_content=$(curl -sS $script_url)
script_hash=$(echo "$script_content" | shasum | awk '{print $1}')
$debug && echo "Script Hash: $script_hash"

# Generate the word list
word_list=( $(man ls | grep -o '\b[a-z]\{3,\}\b' | sort -u) )
$debug && echo "Word List Length: ${#word_list[@]}"

# Generate human-readable words from the hash using the same logic as in the one-liner
human_readable_hash=""
for i in 0 2 4 6; do
    word_index=$((0x${script_hash:$i:2} % ${#word_list[@]}))
    $debug && echo "Index: $word_index"
    human_readable_hash+="${word_list[$word_index]}-"
done
human_readable_hash=${human_readable_hash%-}  # Remove trailing dash
$debug && echo "Generated Human-Readable Hash: $human_readable_hash"

# Fetch the one-liner template
one_liner_template=$(curl -sS $one_liner_template_url)

# Substituting the placeholders in the template with actual values
one_liner=$(echo "$one_liner_template" | \
            sed "s|{{URL}}|$script_url|g" | \
            sed "s|{{EXPECTED_WORDS}}|$human_readable_hash|g")

# Print the processed one-liner
echo "$one_liner"

# If debug mode is on, print additional debug information
if $debug; then
  echo "Locale:"
  locale
  echo "Shell: $SHELL"
  echo "Running One-Liner in Subshell:"
  eval "$one_liner"
fi
