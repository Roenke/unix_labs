#!/bin/bash
read email_address
echo email_address| grep -ioP "^([\.,-_0-9a-z]*[a-z][\.,-_0-9a-z]*)@([a-z]+\.)+[a-z]+$"
