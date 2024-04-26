grep -q '^78fb38f212fa49029aff24c669a39648d9b4e68b' <<< $(curl -s https://raw.githubusercontent.com/Manpoozle/TrustLaunch/main/tl.sh | shasum | cut -d ' ' -f1) && sh
