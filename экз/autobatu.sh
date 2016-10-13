#!/bin/bash
sudo cp myscript /etc/init.d/
sudo update-rc.d myscript start 70 2 . stop 20 0 .