grep -q '^expected_hash_prefix' <<<$(curl -s[URL]|shasum|cut -d' ' -f1) && sh
