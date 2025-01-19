_alsa_utils_list_cards() {
  local card=''
  command aplay -l \
    | command grep -Eo '^card [0-9]+: [^,]+' \
    | command uniq \
    | while builtin read card; do
    card="${card#card }"
    local id="${card%%: *}"
    local name="${card#*: }"
    builtin printf '%s\t%s\n' "$id" "$name"
  done
}

_alsa_utils_list_devices() {
  local card=''
  command aplay -l \
    | command grep -Eo '^card [0-9]+: [^,]+' \
    | command uniq \
    | while builtin read card; do
    card="${card#card }"
    local id="${card%%: *}"
    local name="${card#*: }"
    builtin printf 'hw:%s\t%s\n' "$id" "$name"
  done
}
