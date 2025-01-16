function _aplaymidi_list_ports
  command aplaymidi -l \
    | command tail -n +2 \
    | while read port desc
    printf '%s\t%s' $port $desc
  end
end
