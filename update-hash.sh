#!/bin/bash

# Path to the script file
script_path="your_bootstrapping_script.sh"

# Calculate new hash
new_hash=$(shasum -a 256 $script_path | awk '{print $1}')

# File containing the one-liner
one_liner_file="tl.sh"

# Read the current one-liner
current_one_liner=$(cat $one_liner_file)

# Regex to match a SHA-256 hash or the placeholder 'known_good_hash'
hash_regex="[a-f0-9]{64}|known_good_hash"

# Replace the hash in the one-liner
updated_one_liner=$(echo "$current_one_liner" | sed "s/$hash_regex/$new_hash/")

# Write the updated one-liner back to the file
echo "$updated_one_liner" > $one_liner_file
