#!/bin/sh
if [[ ! -e /data/application.yml ]]; then
   wget https://raw.githubusercontent.com/streamaserver/streama/master/grails-app/conf/application.yml -P /tmp
   cp -rf /tmp/application.yml /data/application.yml
fi

if [[ ! -e /app/application.yml ]]; then
	cp -rf /data/application.yml /app/application.yml
  else
	rm -rf /app/application.yml
	cp -rf /data/application.yml /app/application.yml
fi

if [[ ! -e /app/streama.war ]]; then
   wget $(wget -qO- 'https://api.github.com/repos/streamaserver/streama/releases/latest' | grep browser_download_url | cut -d '"' -f 4) -P /app --output-document=streama.war
fi
