_aplaymidi_list_ports() {
  local card
  command aplaymidi -l \
    | command tail -n +2 \
    | while builtin read port desc; do
    builtin echo "$port"
  done
}
