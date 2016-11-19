#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

TAGLIST=""
TAGLIST+="-inbox +calendar -- tag:inbox and from:wiki@stylefruits.de and subject:calendar"
TAGLIST+=$'\n'
TAGLIST+="-inbox +clojure -- tag:inbox and to:clojure@googlegroups.com"
TAGLIST+=$'\n'
TAGLIST+=$(notmuch search --sort=oldest-first --format=text --format-version=2 --output:threads subject:'accepted merge request' | awk '{if (NR%2) {print "+inbox --", $0} else {print "-inbox --", $0}}')
echo "${TAGLIST}" | notmuch tag --batch
