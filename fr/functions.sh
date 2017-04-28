pg_chacon_lg() {
  case "$1" in
    no_device_matching) echo "Aucun appareil ne correspond à $2";;
    switching_on) echo "J'allume $2";;
    switching_off) echo "J'éteins $2";;
    switching_on_done) echo "$2 allumé";;
    switching_off_done) echo "$2 éteint";;
    *) jv_error "Erreur: Clef de traduction '$2' non reconnue. Merci de contacter le concepteur de ce plugin.";;
  esac
}
