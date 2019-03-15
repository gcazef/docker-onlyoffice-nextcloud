#!/bin/bash

set -x

if [ -z "$1" ]

then
	echo "\$Empty parameter. Please enter the full path of the font folder" > /dev/null
	return
fi

echo "### Copy fonts to the container" > /dev/null
for f in $1/*.ttf;

do
	docker cp $f app-onlyoffice-document-server:/usr/share/fonts/;
done

echo "### Generating fonts" > /dev/null
docker exec app-onlyoffice-document-server /usr/bin/documentserver-generate-allfonts.sh