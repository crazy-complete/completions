function _alsa_utils_list_pcm_devices
  set -l card

  for card in (command aplay -L | string match -r '^[^ ]+')
    printf '%s\n' $card
  end
end
