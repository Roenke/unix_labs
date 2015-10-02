#!/bin/bash

echo "Yes, it's a sudo"

# Init and src
sudo cp mycron /etc/init.d
sudo cp mycron.py /usr/src/

# Logs and config
sudo touch /var/mycron.log
sudo touch /etc/mycron.cfg

# ToDo: 755?
sudo chmod 755 /etc/init.d/mycron

# Symlink creation
sudo ln -s /etc/init.d/mycron /etc/rc0.d/K30mycron 
sudo ln -s /etc/init.d/mycron /etc/rc3.d/S40mycron 
sudo ln -s /etc/init.d/mycron /etc/rc5.d/S40mycron 
sudo ln -s /etc/init.d/mycron /etc/rc2.d/S40mycron 

# Log and config
sudo ln -s /var/mycron.log ./mycron.log
sudo ln -s /etc/mycron.cfg ./mycron.cfg

# Source
sudo ln -s ../src/mycron.py /usr/bin/mycron  
