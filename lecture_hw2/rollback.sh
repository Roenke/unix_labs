#!/bin/bash

# Init and src
#sudo cp mycron /etc/init.d
#sudo cp mycron.py /usr/src/
sudo rm /etc/init.d/mycron
sudo rm /usr/src/mycron.py

# Logs and config
# sudo touch /var/mycron.log
# sudo touch /etc/mycron.cfg
sudo rm /var/mycron.log /etc/mycron.cfg

# Symlink creation
# sudo ln -s /etc/init.d/mycron /etc/rc0.d/K30mycron 
# sudo ln -s /etc/init.d/mycron /etc/rc3.d/S40mycron 
# sudo ln -s /etc/init.d/mycron /etc/rc5.d/S40mycron 
# sudo ln -s /etc/init.d/mycron /etc/rc2.d/S40mycron 
sudo rm /etc/rc0.d/K30mycron 
sudo rm /etc/rc3.d/S40mycron 
sudo rm /etc/rc5.d/S40mycron 
sudo rm /etc/rc2.d/S40mycron

# Log and config
# sudo ln -s /var/mycron.log ./mycron.log
# sudo ln -s /etc/mycron.cfg ./mycron.cfg
rm ./mycron.log
rm ./mycron.cfg

# Source
# sudo ln -s ../src/mycron.py /usr/bin/mycron
sudo rm /usr/bin/mycron
