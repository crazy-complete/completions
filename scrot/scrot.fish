function _scrot_monitors
  set -l num_monitors $(command xrandr 2>/dev/null | command grep ' connected' | command wc -l)
  command seq 0 $(math $num_monitors - 1)
end
