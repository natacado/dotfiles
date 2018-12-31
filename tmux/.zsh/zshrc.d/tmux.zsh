# Use tmux split for less-like functionality, so you can see prior shell
# history while looking through less
tess() {
  temp_file=$(mktemp)
  echo $temp_file
  cat > $temp_file
  tmux split-window -h -d "cat $temp_file | less; rm $temp_file"
}

# https://fb.workplace.com/groups/hack.of.the.day/permalink/1618798314835444/
if type -f fpp > /dev/null; then
  alias ff='tmux capturep -Jp -S 0 -E - | fpp'
fi
