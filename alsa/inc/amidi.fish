function _amidi_list_ports
  set -l dir
  set -l port
  set -l name
  command amidi -l \
    | command tail -n +2 \
    | while read dir port name
    printf '%s\t%s\n' $port $name
  end
end
