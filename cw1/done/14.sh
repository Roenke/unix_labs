#!/bin/bash

git clone -b master --single-branch git@github.com:OpenCorpora/opencorpora.git
cd opencorpora
ag "token" -l -G .php$ | while read name
do
	sed -i "1 i\// This file contains 'token'" "$name"
done
