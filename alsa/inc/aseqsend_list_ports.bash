_aseqsend_list_ports() {
  local port desc
  command aseqsend -l \
    | command tail -n +2 \
    | while builtin read port desc; do
    builtin echo "$port"
  done
}
