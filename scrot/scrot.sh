_scrot_monitors() {
  local num_monitors=$(command xrandr 2>/dev/null | command grep ' connected' | command wc -l)
  command seq 0 $((num_monitors - 1))
}
