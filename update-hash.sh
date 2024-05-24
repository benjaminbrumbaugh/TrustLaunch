#!/bin/bash

# Source configuration variables
source config.sh

# Fetch the script and compute its hash once
script_content=$(curl -sS $script_url)
script_hash=$(echo "$script_content" | shasum | awk '{print $1}')

# Generate the word list
word_list=( $(man ls | grep -o '\b[a-z]\{3,\}\b' | sort -u) )

# Generate human-readable words from the hash
human_readable_hash=""
for i in 0 2 4 6; do
    word_index=$((0x${script_hash:$i:2} % ${#word_list[@]}))
    human_readable_hash+="${word_list[$word_index]}-"
done
human_readable_hash=${human_readable_hash%-}  # Remove trailing dash

# Fetch the one-liner template
one_liner_template=$(curl -sS $one_liner_template_url)

# Substituting the placeholders in the template with actual values
one_liner=$(echo "$one_liner_template" | \
            sed "s|{{URL}}|$script_url|g" | \
            sed "s|{{EXPECTED_WORDS}}|$human_readable_hash|g")

# Print the processed one-liner
echo "$one_liner"
