#!/bin/bash

# URLs for the script and the one-liner template
script_url="https://raw.githubusercontent.com/manpoozle/trustlaunch/main/ts.sh"
one_liner_template_url="https://raw.githubusercontent.com/manpoozle/trustlaunch/main/trust_launch_template.sh"

# Fetch the script and compute its hash
script_content=$(curl -sS $script_url)
script_hash=$(curl -sS $script_url | shasum | awk '{print $1}')

# Fetch the one-liner template
one_liner_template=$(curl -sS $one_liner_template_url)

# Substituting the placeholders in the template with actual values
# Assuming placeholders are {{URL}} for the script URL and {{EXPECTED_HASH_PREFIX}} for the hash
one_liner=$(echo "$one_liner_template" | \
            sed "s|{{URL}}|$script_url|g" | \
            sed "s|{{EXPECTED_HASH_PREFIX}}|$script_hash|g")

# Print the processed one-liner
echo "$one_liner"
