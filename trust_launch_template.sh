s=$(curl -s {{URL}}); h=$(shasum <<< "$s" | cut -d' ' -f1); w=($(man ls|grep -o '\b[a-z]\{3,\}\b'|sort -u)); o=""; for i in 0 2 4 6; do o+="${w[0x${h:$i:2} % ${#w[@]}]}-"; done; [[ "${o%-}" == "{{EXPECTED_WORDS}}" ]] && sh <<< "$s" || { echo "Stale launch script. Stopping." >&2; false; }
