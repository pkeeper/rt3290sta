rt3290sta
=========

Forked driver for Ralink RT3290 Wi-Fi adapter for Linux Kernel => 3.8

Driver status
=============
While not fully stable, it works much better than rt2800pci kernel driver. If it stops to work, reload the driver. Bluetooth is not working.
You need to recompile driver on every kernel update (or you could make DKMS from it and send me a patch). 

instalation
===========
 * fork this repo
 * cd into it
 * compile the driver
 * install the driver
  
 comand for that (it will ask your user password to apply changes to system) :
 `git clone https://github.com/pkeeper/rt3290sta.git && cd rt3290sta && make && sudo make install && sudo modprobe -r rt2800pci && sudo modprobe rt3290sta`

Now you need to make it load on startup. Blacklist the "rt2800pci" driver in /etc/modprobe.d/blacklist.conf and add "rt3290sta" to /etc/modules.

reinstaling
===========
cd to a driver directory, run `make clean && make && sudo make install && modprobe rt3290sta`


help
====
If someone could debug it and make patches, it could be pretty cool :)
