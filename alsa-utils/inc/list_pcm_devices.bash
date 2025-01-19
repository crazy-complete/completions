_alsa_utils_list_pcm_devices() {
  local card
  command aplay -L \
    | command grep -Eo '^[^ ]+' \
    | while builtin read card; do
    builtin echo "$card"
  done
}
