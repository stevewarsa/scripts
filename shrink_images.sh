for i in *.jpg; do convert "$i" -resize 50% "${i%%.jpg*}.jpg"; done
