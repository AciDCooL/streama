#!/bin/bash
if [[ ! -e /data/application.yml ]]; then
   curl -sf  -o /tmp/application.yml -L https://raw.githubusercontent.com/streamaserver/streama/master/grails-app/conf/application.yml
   cp -rf /tmp/application.yml /data/application.yml
fi

if [[ ! -e /app/application.yml ]]; then
	cp -rf /data/application.yml /app/application.yml
  else
	rm -rf /app/application.yml
	cp -rf /data/application.yml /app/application.yml
fi

if [[ ! -e /app/streama.jar ]]; then
   curl -sf  -L $(curl -s 'https://api.github.com/repos/streamaserver/streama/releases/latest' | grep browser_download_url | cut -d '"' -f 4) -o /app/streama.jar
fi
