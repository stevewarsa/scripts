#img=`ls |sort -R |tail -1` 
while true
do
    img=`find . -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.gif" \) | sort -R | tail -1 | cut -c 3-`
    echo "Launching image $img ..."
    /cygdrive/c/Program\ Files/Paint.NET/PaintDotNet.exe $img
done
