_alsamixer_list_cards() {
  local card
  command aplay -l | grep -Eo '^card [0-9]+: [^,]+' | uniq | while read card; do
    card="${card#card }"
    local id="${card%%: *}"
    echo "$id"
  done
}
