curl -s https://raw.githubusercontent.com/manpoozle/TrustLaunch/main/scripts/tl.sh | shasum -a 256 -c <(echo "known_good_hash  -") && sh
