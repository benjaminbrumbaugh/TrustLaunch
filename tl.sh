s=$(curl -s https://raw.githubusercontent.com/manpoozle/trustlaunch/main/ts.sh); shasum <<< "$s" | cut -d' ' -f1 | grep -q '^78fb38f212fa49029aff24c669a39648d9b4e68b' && sh <<< "$s" || return 1
