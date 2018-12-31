
if [ -d $HOME/bin ]; then
  PATH=$PATH:/usr/local/sbin:$HOME/bin
fi
if [ -d $HOME/bin/override ]; then
  PATH=$HOME/bin/override:$PATH
fi
