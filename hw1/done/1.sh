#!/bin/bash
find ./* -user "$USER" -type f -print0 | xargs -0 -I x echo '1' | wc --lines
