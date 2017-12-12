## CORE / ! \

```bash
#!/bin/sh
#Liste non exhaustive de mes indispensables
#OS - Elementary OS Loki
#@davidmolinari

#Update
sudo apt-get update && sudo apt-get dist-upgrade -y
echo "update done"

#Common
sudo apt-get install software-properties-common

#Firefox
sudo apt-get install firefox -y
echo "install firefox done"


#Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable -y
echo "install chrome done"

#Vim
sudo apt-get install vim -y
echo "install vim done"

#Clean
sudo apt-get purge midori-granite
sudo apt-get purge bluez
sudo apt-get autoremove
sudo apt-get autoclean

#Node
sudo apt-get install nodejs
sudo apt-get install npm
echo "install node/npm don"

#ElementaryPlus
sudo add-apt-repository ppa:cybre/elementaryplus
sudo apt-get update
sudo apt-get upgrade && sudo apt-get install elementaryplus
echo "install elementaryplus done"

#ElementaryTweaks
sudo add-apt-repository ppa:philip.scott/elementary-tweaks && sudo apt-get update
sudo apt-get install elementary-tweaks

#+build à décommenter
#sudo apt-get install libgconf2-dev libpolkit-gobject-1-dev libswitchboard-2.0-dev elementary-sdk
#mkdir build
#cd build
#cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ../
#make 

#sudo make install 
#switchboard

echo "install elementarytweaks done"


#Sublime Text 3
sudo add-apt-repository ppa:webupd8team/sublime-text-3 -y
sudo apt-get update
sudo apt-get install sublime-text-installer -y
echo "install sublimetext3 done"

```
