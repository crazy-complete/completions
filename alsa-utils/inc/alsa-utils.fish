function _alsa_utils_list_cards
  set -l card

  for card in (command aplay -l | string match -r '^card [0-9]+: [^,]+')
    set card (string replace 'card ' '' $card)
    set -l split (string split ': ' $card)

    if set -q split[2]
      printf "%s\t%s\n" $split[1] $split[2]
    end
  end
end

function _alsa_utils_list_devices
  set -l card

  for card in (command aplay -l | string match -r '^card [0-9]+: [^,]+')
    set card (string replace 'card ' '' $card)
    set -l split (string split ': ' $card)

    if set -q split[2]
      printf "hw:%s\t%s\n" $split[1] $split[2]
    end
  end
end
