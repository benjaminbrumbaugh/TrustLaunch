curl -sS [URL] | tee >(shasum -a 256 | read h _; echo ${h:0:2}${h:2:2} | xargs -I{} sh -c "awk 'NR==0x{}' /usr/share/dict/words" | tr '\n' '-' | xargs -I{} test '{}' = 'word1 word2' && sh) >(cat)

