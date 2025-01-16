_aplaymidi_list_ports() {
  local card='' desc=''
  command aplaymidi -l \
    | command tail -n +2 \
    | while builtin read port desc; do
    builtin printf '%s\t%s\n' "$port" "$desc"
  done
}
