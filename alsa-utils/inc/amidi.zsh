_amidi_list_ports() {
  local dir='' port='' name=''
  command amidi -l \
    | command tail -n +2 \
    | while builtin read dir port name; do
    builtin printf '%s\t%s\n' "$port" "$name"
  done
}
