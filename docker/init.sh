#!/bin/sh
if [[ ! -e /data/application.yml ]]; then
   cp -rf /tmp/application.yml /data/application.yml
fi

if [[ ! -e /app/application.yml ]]; then
	ln -s /data/application.yml /app/application.yml
  else
	rm -rf /app/application.yml
	ln -s /data/application.yml /app/application.yml
fi

if [[ ! -e /app/streama.war ]]; then
   wget $(wget -qO- 'https://api.github.com/repos/streamaserver/streama/releases/latest' | grep browser_download_url | cut -d '"' -f 4) -P /app
fi
