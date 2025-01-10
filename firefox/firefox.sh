_firefox_profiles() {
  command sed -n 's/^ *Name *=\(.*\)$/\1/p' ~/.mozilla/firefox/profiles.ini
}
