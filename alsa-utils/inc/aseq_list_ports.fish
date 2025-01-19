function _aseq_list_ports
  set -l port
  set -l desc
  command aseqdump -l \
    | command tail -n +2 \
    | while read port desc
    printf '%s\t%s\n' $port $desc
  end
end
