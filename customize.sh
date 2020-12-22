unzip -o "$ZIPFILE" 'system/fonts/JoyPixels.ttf' -d $MODPATH >&2
ui_print "- Searching in fonts.xml"
[[ -d /sbin/.core/mirror ]] && MIRRORPATH=/sbin/.core/mirror || unset MIRRORPATH
FILE=/system/etc/fonts.xml
FILENAME=$(sed -ne '/<family lang="und-Zsye".*>/,/<\/family>/ {s/.*<font weight="400" style="normal">\(.*\)<\/font>.*/\1/p;}' $MIRRORPATH$FILE)
for i in $FILENAME
do
ui_print "- Copying font files to $i"
cp -f $MODPATH/system/fonts/JoyPixels.ttf $MODPATH/system/fonts/$i
done