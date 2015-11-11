#!/bin/bash
read html_tag
echo "$html_tag" | grep -P "^<[a-z]+\/>|<([a-z]+)>[^<]*<\/\1>$" 
