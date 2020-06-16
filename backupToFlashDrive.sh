cd /cygdrive/c/backup/
cp -R pictures/ /cygdrive/i/
find important_docs/ -type f -size -140M -exec cp --parents \{\} /cygdrive/i/ \;
cp -R /home/warsa /cygdrive/i/

