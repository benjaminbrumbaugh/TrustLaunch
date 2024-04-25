curl -s [URL] | shasum | read h; awk -v a="$(printf "%d" "0x${h:0:2}")" -v b="$(printf "%d" "0x${h:3:2}")" 'NR==a||NR==b{print}' /usr/share/dict/words | grep -q 'word1-word2' && sh

