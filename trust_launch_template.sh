s=$(curl -s {{URL}}); shasum <<< "$s" | cut -d' ' -f1 | grep -q '^{{EXPECTED_HASH_PREFIX}}' && sh <<< "$s"
