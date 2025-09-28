_legendary_list_aliases() {
  local line

  command legendary alias list | {
    builtin read line
    while builtin read -r line; do
      line="${line## }"
      line="${line##-}"
      line="${line## }"
      printf "%s\n" "${line// => /$'\t'}"
    done
  }
}

_legendary_list_installed_games() {
  local line name title trash

  command legendary list-installed --tsv | {
    builtin read line
    while builtin read -r line; do
      IFS=$'\t' read -r name title trash <<< "$line"
      builtin printf "%s\\t%s\\n" "$name" "$title"
    done
  }
}

_legendary_list_available_games() {
  local line name title trash

  command legendary list --tsv | {
    builtin read line
    while builtin read -r line; do
      IFS=$'\t' read -r name title trash <<< "$line"
      builtin printf "%s\\t%s\\n" "$name" "$title"
    done
  }
}
