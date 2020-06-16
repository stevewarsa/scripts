#/cygdrive/c/ImageMagick/identify
for filename in /cygdrive/c/backup/pictures/landscape/*; do
	echo $filename
	#WIDTH="$(/cygdrive/c/ImageMagick/identify -format %w filename)"
    #HEIGHT="$(/cygdrive/c/ImageMagick/identify -format %h filename)"
    #if [ WIDTH -gt HEIGHT ]; then
      # Move image to landscape folder
    #fi
done
