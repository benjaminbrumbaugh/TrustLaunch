s=$(curl -s {{URL}}); shasum <<< "$s" | cut -d' ' -f1 | grep -q '^{{EXPECTED_HASH_PREFIX}}' && sh <<< "$s" || { echo "Stale launch script. Stopping." >&2; false; }
