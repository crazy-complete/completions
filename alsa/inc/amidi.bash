_amidi_list_ports() {
  local dir port name
  command amidi -l \
    | command tail -n +2 \
    | while builtin read dir port name; do
    builtin echo "$port"
  done
}
