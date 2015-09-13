#!/bin/bash
pgrep $1 | xargs -I x ps -p x --no-header -o pid,cmd
