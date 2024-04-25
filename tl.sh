curl -sS [URL] | tee >(shasum -a 256 | cut -f1 -d' ' | fold -w2 | awk '{printf "%d ", "0x"$1}' | xargs -I{} awk 'NR=={}' /usr/share/dict/words | tr '\n' '-' | xargs -I{} test '{}' = 'word1 word2' && sh) >(cat)

