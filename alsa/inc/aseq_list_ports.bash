_aseq_list_ports() {
  local port desc
  command aseqdump -l \
    | command tail -n +2 \
    | while builtin read port desc; do
    builtin echo "$port"
  done
}
