grep -q '^403e2020efd7c89668a95a5c8d4cbfb2c5ed0399' <<< $(curl -s https://raw.githubusercontent.com/Manpoozle/TrustLaunch/main/tl.sh | shasum | cut -d ' ' -f1) && sh
