#!/bin/bash

#create a directory to store rendered output
mkdir -p render
#remove the blend file if it exists (we may update it)
[ -e promo_linux.blend ] && rm promo_linux.blend

#download the blend file and if download is successfule start the rendering from frames specified by user input
if wget www.oscgeeks.org/CCC/promo_linux.blend &&
   blender -b promo_linux.blend -E CYCLES -s $1 -e $2 -a -o render; then
   	echo "rendered successfully!"
else
	exit 1
fi

PWD="$(pwd)"
not_uploaded = 
#for each file in render start uploading to our server (there is a php file handling the requests on the other side.
for i in render/*; do
	curl -F "fileToUpload=@$PWD/$i" www.oscgeeks.org/CCC/upload.php
	
	echo "\n"
done

#clean up and exit
if [ $? -eq 0 ]; then
	rm -r render/
	rm promo_linux.blend
	echo "All done. Thank you <3 :D"
else
	echo "something went wrong while uploading the photos :("
fi
