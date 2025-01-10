_amixer_list_simple_mixer_control() {
  command amixer scontrols | command sed 's/Simple mixer control //' | command tr -d "'"
}

_amixer_list_mixer_control() {
  command amixer controls | command tr -d "'"
}
