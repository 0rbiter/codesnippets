find /root/ * | grep -P '^(.*)config\.guess.*$' | xargs -d'\n' -I{} bash -c 'grep timestamp= {}' bash
