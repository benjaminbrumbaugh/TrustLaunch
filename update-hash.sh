#!/bin/bash

# Source configuration variables
source config.sh

# Fetch the script and compute its hash once
script_content=$(curl -sS $script_url)
script_hash=$(echo "$script_content" | shasum | awk '{print $1}')

# Fetch the one-liner template
one_liner_template=$(curl -sS $one_liner_template_url)

# Substituting the placeholders in the template with actual values
one_liner=$(echo "$one_liner_template" | \
            sed "s|{{URL}}|$script_url|g" | \
            sed "s|{{EXPECTED_HASH_PREFIX}}|$script_hash|g")

# Print the processed one-liner
echo "$one_liner"

