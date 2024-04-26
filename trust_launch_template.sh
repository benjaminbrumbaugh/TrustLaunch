grep -q '^{{EXPECTED_HASH_PREFIX}}' <<< $(curl -s {{URL}} | shasum | cut -d ' ' -f1) && sh
