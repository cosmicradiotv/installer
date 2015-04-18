#!/bin/bash

command -v git >/dev/null 2>&1 || { echo >&2 "Can't find git. Aborting"; exit 1; }
command -v php >/dev/null 2>&1 || { echo >&2 "Can't find php (cli)). Aborting"; exit 1; }
command -v composer >/dev/null 2>&1 || { echo >&2 "Can't find composer. Aborting"; exit 1; }

if [[ "$1" != "https" ]]; then
	PLUGIN_PODCAST_URL="git@github.com:cosmicradiotv/podcast-plugin.git"
	THEME_URL="git@github.com:cosmicradiotv/u62-theme.git"
else
	PLUGIN_PODCAST_URL="https://github.com/cosmicradiotv/podcast-plugin.git"
	THEME_URL="https://github.com/cosmicradiotv/u62-theme.git"
fi

composer create-project october/october crtv dev-master --prefer-dist
git clone "$PLUGIN_PODCAST_URL" "crtv/plugins/cosmicradiotv/podcast"
git clone "$THEME_URL" "crtv/themes/u62"

echo ""
echo "Cloned!"
echo ""
echo "Follow the instructions *after the composer step*:"
echo "http://octobercms.com/docs/help/console#console-install"