#!/bin/bash

AZUL1='\033[94m' ### BLUE
AZUL2='\033[95m' ### PURPLE
AZUL3='\033[96m' ### CYAN
ROJO='\033[91m' ### RED
VERDE='\033[92m' ### GREEN
NARANJA='\033[93m' ### YELLOW
RC='\e[0m' ### RESET COLOR TO DEFAULT
COLOROFF='\033[0m' ### NO COLOR

# get the current directory and store as the bash source path.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#store where installs will take place rather than needing to edit entire script 
home_dir=$HOME
INSTDIR=$home_dir/_installed/sherlock

#store the pathas an environment variable to be used for all the .desktop scripts
# can be called with cd "${MY_SHERLOCK}"
export_line="export MY_SHERLOCK=\"$INSTDIR\""
echo "$export_line" >> ~/.bashrc
source ~/.bashrc

### create installation path for applications
mkdir  $INSTDIR


echo -e "$RC"
echo -e "$RC"         
echo -e "$AZUL1   ____    _                     _                  _      "
echo -e "$AZUL1  / ___|  | |__     ___   _ __  | |   ___     ___  | | __  "
echo -e "$AZUL2  \___ \  | '_ \   / _ \ | '__| | |  / _ \   / __| | |/ /  "
echo -e "$AZUL2   ___) | | | | | |  __/ | |    | | | (_) | | (__  |   <   "
echo -e "$AZUL3  |____/  |_| |_|  \___| |_|    |_|  \___/   \___| |_|\_\  "
echo -e "$RC"
echo -e "$AZUL1                        _      _                  "  
echo -e "$AZUL1                       | |    (_)                 "
echo -e "$AZUL1                       | |     _ _ __  _   ___  __"
echo -e "$AZUL2                       | |    | | '_ \| | | \ \/ /"
echo -e "$AZUL2                       | |____| | | | | |_| |>  < "
echo -e "$AZUL3                       |______|_|_| |_|\__,_/_/\_\  v.1"
echo -e "$RC"
echo -e "$AZUL This script will turn your Debian OS into a dedicated distribution".
echo -e "$AZUL to obtain information from open sources, will perform the". 
echo -e "$AZUL following actions:"
echo -e "$RC"
echo -e "$AZUL 1. It will install the most commonly used applications in OSINT for the collection".
echo -e "$AZUL of information from open sources."
echo -e "$RC"
echo -e "$AZUL 2. It will customize the desktop menu to have the applications accessible."
echo -e "$AZUL by category."
echo -e "$RC"
echo -e "$AZUL 3. Will configure Google Chrome and Mozilla Firefox browsers with great".
echo -e "$AZUL amount of resources for OSINT."
echo -e "$RC"
echo -e "$AZUL For more information you can visit the website $AZUL3 www.sherlock-linux.org"
echo -e "$RC"
echo -e "$NARANJA [Press enter to begin] ====>>>>>>>>"
read -p ""
echo -e "$RC"




### Update cache and apps
sudo apt -y update && sudo apt -y upgrade

### Install deployment dependencies
sudo apt install -y git
sudo apt install -y curl
sudo apt install -y default-jre
sudo apt install -y python3
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y zip
sudo apt install -y libglib2.0-dev
sudo apt install -y wget

### Remove unnecessary installations
sudo apt remove -y xterm
sudo apt purge -y xterm

### Install GNOME tools
### sudo apt install -y gnome-terminal
### sudo apt install -y dbus-x11
### xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
### gsettings set org.gnome.Terminal.Legacy.Settings confirm-close false
### gsettings set org.gnome.desktop.sound event-sounds false

### Install network dependencies and enable
sudo apt install -y network-manager
sudo apt install -y network-manager-gnome
sudo systemctl enable NetworkManager.service

### cp files to install path
cp -rf . $INSTDIR

### install GO
cd $INSTDIR
wget -c https://go.dev/dl/go1.20.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.20.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm go1.20.4.linux-amd64.tar.gz


echo -e "$VERDE Install Virtual Environment Dependencies $RC"
echo -e "$RC"
 
#sudo add-apt-repository multiverse
#sudo apt install -y virtualbox-guest-dkms virtualbox-guest-x11
#sudo adduser osint vboxsf

### Install Open VM Tools
sudo apt install -y open-vm-tools
sudo apt install -y open-vm-tools-desktop

echo -e "$VERDE Virtual machine requirements installed! $RC"
echo -e "$RC"


echo -e "$VERDE Configure Styles $RC"
echo -e "$RC"

#sudo mv /usr/share/images/desktop-base/desktop-grub.png /usr/share/images/desktop-base/desktop-grubBACKUP.png
#sudo cp $SCRIPT_DIR/imagenes/desktop-grub.png /usr/share/images/desktop-base/desktop-grub.png
#sudo mv /etc/default/grub /etc/default/grubBACKUP
#sudo cp $SCRIPT_DIR/other/grub /etc/default/grub
#sudo update-grub


#sudo cp $SCRIPT_DIR/imagenes/desktop-background.png /usr/share/images/desktop-base/default
#sudo cp $SCRIPT_DIR/imagenes/login-background.svg /usr/share/images/desktop-base/login-background.svg


#sudo mv /usr/share/images/desktop-base/desktop-lockscreen.xml /usr/share/images/desktop-base/desktop-lockscreenBACKUP.xml
#sudo cp $SCRIPT_DIR/imagenes/desktop-lockscreen.xml /usr/share/images/desktop-base/desktop-lockscreen.xml
#sudo ln -s /usr/share/images/desktop-base/login-background.svg /usr/share/desktop-base/emerald-theme/login/background.svg	

#sudo apt install -y lightdm-gtk-greeter-settings
#sudo mv /etc/lightdm/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.confBACKUP
#sudo cp $SCRIPT_DIR/other/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
#sudo cp $SCRIPT_DIR/imagenes/sherlock.png /usr/share/images/desktop-base/sherlock.png
#default-user-image = /usr/share/images/desktop-base/sherlock.png

#xset b off

#echo -e "$VERDE Styles applied! $RC"
#echo -e "$RC"


###
### Install tools identified as the Sherlock collection 
###

### Install Firefox-esr 
### https://www.ubuntuupdates.org/ppa/mozilla_esr
sudo add-apt-repository ppa:mozillateam/ppa 
sudo apt-get update
echo -e "$AZUL3 Installing Firefox..."
sudo apt install -y firefox-esr
firefox-esr
echo -e "$VERDE Firefox Installed $RC"

### Install Google Chrome
echo -e "$AZUL3 Installing Google Chome..."
echo -e "$COLOROFF"
lsb_release -a
cd $INSTDIR
wget -c https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
sudo apt --fix-broken install -y
rm -R $INSTDIR/google-chrome-stable_current_amd64.deb
echo -e "$VERDE Google Chome Installed $RC"
echo -e "$RC"


#Its possible that the link doesnt work, in this case change the url with the correct one
echo -e "$AZUL3 Installing Tor..."
echo -e "$COLOROFF"
cd $INSTDIR
#wget -c https://www.torproject.org/dist/torbrowser/13.0.6/tor-browser-linux-x86_64-13.0.6.tar.xz
wget -c https://dist.torproject.org/torbrowser/14.5a6/tor-browser-linux-x86_64-14.5a6.tar.xz
tar -xvf tor-browser-linux-x86*.tar.xz
rm -R $INSTDIR/tor-browser-linux-x86*.tar.xz
cd $INSTDIR/tor-browser
./start-tor-browser.desktop --register-app
echo -e "$VERDE Tor Installed $RC"
echo -e "$RC"


echo -e "$VERDE Browsers Installed! $RC"
echo -e "$RC"

echo -e "$AZUL3 Configure Mozilla Firefox... $RC"
export DISPLAY=:0
firefox-esr &
sleep 5
pkill -f firefox
mkdir $INSTDIR/firefox
unzip $SCRIPT_DIR/firefox.zip -d $INSTDIR/firefox
\cp -R $INSTDIR/firefox/* ~/.mozilla/firefox/*.default-esr
rm -R $INSTDIR/firefox
rm -R $SCRIPT_DIR/firefox.zip
echo -e "$VERDE Mozilla Firefox Configured $RC"
echo -e "$RC"


echo -e "$AZUL3 Configure Google Chrome... $RC"
pkill --oldest chrome
mkdir $INSTDIR/chrome
mkdir -p ~/.config/google-chrome
unzip $SCRIPT_DIR/chrome.zip -d $INSTDIR/chrome
cp -R $INSTDIR/chrome/* ~/.config/google-chrome
rm -R $INSTDIR/chrome
rm -R $SCRIPT_DIR/chrome.zip
echo -e "$VERDE Google Chrome configured $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing Maltego... $RC"
mkdir  $INSTDIR/maltego && cd  $INSTDIR/maltego
wget -c https://downloads.maltego.com/maltego-v4/linux/Maltego.v4.4.1.deb
sudo dpkg -i Maltego.v4.4.1.deb
sudo apt install -y maltego
rm $INSTDIR/maltego/Maltego.v4.4.1.deb
echo -e "$VERDE Maltego Installed $RC"
 

echo -e "$AZUL3 Installing Google Earth Pro... $RC"
mkdir  $INSTDIR/google-earth && cd  $INSTDIR/google-earth
wget https://dl.google.com/dl/earth/client/current/google-earth-pro-stable_current_amd64.deb
sudo apt install -y $INSTDIR/google-earth/google-earth-pro-stable_current_amd64.deb
rm $INSTDIR/google-earth/google-earth-pro-stable_current_amd64.deb
echo -e "$VERDE Google Earth Pro Installed $RC"


echo -e "$AZUL3 Installing Visual Studio Code... $RC"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
echo -e "$VERDE Visual Studio Code Installed $RC"


echo -e "$VERDE Instaling webhttrack $RC"
sudo apt install -y webhttrack 
echo -e "$VERDE Webhttrack Installed $RC"


echo -e "$AZUL3 Installing Yacy... $RC"
mkdir $INSTDIR/yacy
cd $INSTDIR/yacy
sudo dpkg --configure -a
wget https://download.yacy.net/yacy_v1.924_20210209_10069.tar.gz
tar xfz yacy_v1.924_20210209_10069.tar.gz
rm yacy_v1.924_20210209_10069.tar.gz
echo -e "$VERDE Yacy Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing Phoneinfoga... $RC"
mkdir $INSTDIR/phoneinfoga
cd $INSTDIR/phoneinfoga
bash <( curl -sSL https://raw.githubusercontent.com/sundowndev/phoneinfoga/master/support/scripts/install )
sudo mv ./phoneinfoga /usr/local/bin/phoneinfoga
echo -e "$VERDE Phoneinfoga Installed $RC"


echo -e "$AZUL3 Installing GoBuster... $RC"
sudo apt install gobuster
echo -e "$VERDE GoBuster installed $RC"


echo -e "$AZUL3 Installing WhatWeb.. $RC"
sudo apt install -y whatweb
echo -e "$VERDE WhatWeb installed $RC"


echo -e "$AZUL3 Installing XRay... $RC"
git clone https://github.com/evilsocket/xray.git  $INSTDIR/XRay/
cd  $INSTDIR/XRay/
wget  https://go.dev/dl/go1.20.2.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.20.2.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
rm go1.20.2.linux-amd64.tar.gz
make
echo -e "$VERDE XRay Installed $RC"


echo -e "$AZUL3 Installing Certgraph.. $RC"
git clone https://github.com/lanrat/certgraph.git  $INSTDIR/certgraph
cd  $INSTDIR/certgraph
make
go build -o certgraph certgraph.go
echo -e "$VERDE Certgraph Installed $RC"


echo -e "$AZUL3 Installing VLC.. $RC"
sudo apt -y install vlc
echo -e "$VERDE VLC Installed $RC"


#REQUIERE CONFIGURACIÓN MANUAL
echo -e "$AZUL3 Installing Mr.Holmes... $RC"
git clone https://github.com/Lucksi/Mr.Holmes  $INSTDIR/MrHolmes/
cd  $INSTDIR/MrHolmes
python3 -m venv $INSTDIR/MrHolmes/MrHolmes-venv
source MrHolmes-venv/bin/activate
sudo chmod +x install.sh
sudo bash install.sh
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Mr.Holmes Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing Spiderfoot... $RC"
mkdir $INSTDIR/spiderfoot
cd  $INSTDIR/spiderfoot
wget https://github.com/smicallef/spiderfoot/archive/v4.0.tar.gz
tar zxvf v4.0.tar.gz
rm v4.0.tar.gz
python3 -m venv $INSTDIR/spiderfoot/spiderfoot-venv
source spiderfoot-venv/bin/activate
cd spiderfoot-4.0
#Solve problem with Cython 3.0.0
echo "Cython<3" > cython_constraint.txt
PIP_CONSTRAINT=cython_constraint.txt pip install "ai-core-sdk[aicore-content]"
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Spiderfoot Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing Bbot... $RC"
mkdir -p  $INSTDIR/bbot/
cd $INSTDIR/bbot/
python3 -m venv $INSTDIR/bbot/bbot-venv
source bbot-venv/bin/activate
pip3 install bbot
bbot --install-all-deps
deactivate
echo -e "$VERDE Bbot Installed $RC"
 

echo -e "$AZUL3 Installing Pagodo... $RC"
git clone https://github.com/opsdisk/pagodo.git  $INSTDIR/pagodo/
cd  $INSTDIR/pagodo/
python3 -m venv pagodo-venv
source pagodo-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Pagodo Installed $RC"
 

echo -e "$AZUL3 Installing Scanless... $RC"
git clone https://github.com/vesche/scanless  $INSTDIR/scanless/
cd  $INSTDIR/scanless/
python3 -m venv scanless-venv
source scanless-venv/bin/activate
pip install scanless
deactivate
echo -e "$VERDE Scanless Installed $RC"


echo -e "$AZUL3 Installing theHarvester... $RC"
git clone https://github.com/laramies/theHarvester.git  $INSTDIR/theHarvester/
cd  $INSTDIR/theHarvester
python3 -m venv $INSTDIR/theHarvester/theHarvester-venv
source theHarvester-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE theHarvester Installed $RC"
 

echo -e "$AZUL3 Installing Sherlock... $RC"
git clone https://github.com/sherlock-project/sherlock.git  $INSTDIR/Sherlock
cd  $INSTDIR/Sherlock
python3 -m venv $INSTDIR/Sherlock/Sherlock-venv
source Sherlock-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Sherlock Installed $RC"


echo -e "$AZUL3 Installing Photon... $RC"
git clone https://github.com/s0md3v/Photon.git  $INSTDIR/Photon/
cd  $INSTDIR/Photon/
python3 -m venv Photon-venv
source Photon-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Photon Installed $RC"
 

echo -e "$AZUL3 Installing CloudFail... $RC"
git clone https://github.com/m0rtem/CloudFail.git  $INSTDIR/CloudFail/
cd  $INSTDIR/CloudFail/
python3 -m venv CloudFail-venv
source CloudFail-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE CloudFail Installed $RC"
 

echo -e "$AZUL3 Installing CloudScraper... $RC"
git clone https://github.com/jordanpotti/CloudScraper.git  $INSTDIR/CloudScraper/
cd  $INSTDIR/CloudScraper/
python3 -m venv CloudScraper-venv
source CloudScraper-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE CloudScraper Installed $RC"


echo -e "$AZUL3 Installing DNSRecon... $RC"
git clone https://github.com/darkoperator/dnsrecon.git  $INSTDIR/DNSRecon/
cd  $INSTDIR/DNSRecon/
python3 -m venv DNSRecon-venv
source DNSRecon-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE DNSRecon Installed $RC"
 

echo -e "$AZUL3 Installing Hostintel... $RC"
git clone https://github.com/keithjjones/hostintel.git  $INSTDIR/Hostintel/
cd  $INSTDIR/Hostintel/
python3 -m venv Hostintel-venv
source Hostintel-venv/bin/activate
pip3 install -r requirements.txt
deactivate
echo -e "$VERDE Hostintel Installed $RC"


echo -e "$AZUL3 Installing Infoga... $RC"
git clone https://github.com/The404Hacking/Infoga.git  $INSTDIR/infoga/
cd  $INSTDIR/infoga/
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
~/_installed/sherlock
echo "export MY_SHERLOCK=\"$HOME/_installed/sherlock\"" >> -a .bashrc 
echo "export PYENV_ROOT=\"$HOME/.pyenv\"" >> -a .bashrc 
echo "export PATH=\"$PYENV_ROOT/bin:$PATH\"" >> -a .bashrc 
echo "if command -v pyenv 1>/dev/null 2>&1; then" >> -a .bashrc 
echo "	eval \"$(pyenv init --path)\"" >> -a .bashrc 
echo "fi" >> -a .bashrc 
echo "eval \"$(pyenv virtualenv-init -)\"" >> -a .bashrc 
pyenv install 2.7.18
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
pyenv global 2.7.18
pip2 install virtualenv
python2 -m virtualenv infoga-venv
source infoga-venv/bin/activate
pip2 install requests
deactivate
echo -e "$VERDE Infoga Installed $RC"
 

echo -e "$AZUL3 Installing GitRecon... $RC"
git clone https://github.com/GONZOsint/gitrecon.git  $INSTDIR/gitrecon/
cd  $INSTDIR/gitrecon/
python3 -m venv gitrecon-venv
source gitrecon-venv/bin/activate
python3 -m pip install -r requirements.txt
deactivate
echo -e "$VERDE GitRecon Installed $RC"


echo -e "$AZUL3 Installing ExifTool.. $RC"
mkdir -p  $INSTDIR/ExifTool/
cd  $INSTDIR/ExifTool/
wget  https://exiftool.org/Image-ExifTool-12.63.tar.gz
tar xfz Image-ExifTool-12.63.tar.gz
rm Image-ExifTool-12.63.tar.gz
echo -e "$VERDE Exiftool Installed $RC"


echo -e "$AZUL3 Installing EyeWitness... $RC"
git clone https://github.com/RedSiege/EyeWitness.git  $INSTDIR/eyewitness/
cd $INSTDIR/eyewitness
python3 -m venv $INSTDIR/eyewitness/eyewitness-venv
source eyewitness-venv/bin/activate
cd  $INSTDIR/eyewitness/Python/setup
sudo bash setup.sh
pip3 install netaddr
pip3 install selenium
pip3 install fuzzywuzzy
pip3 install pyvirtualdisplay
deactivate
echo -e "$VERDE EyeWitness Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing Metagoofil... $RC"
git clone https://github.com/opsdisk/metagoofil  $INSTDIR/metagoofil/
cd $INSTDIR/metagoofil/
python3 -m venv $INSTDIR/metagoofil/metagoofil-venv
source metagoofil-venv/bin/activate
pip3 install -r requirements.txt
echo -e "$VERDE Metagoofil Installed $RC"


echo -e "$AZUL3 Installing OSFramework... $RC"
mkdir -p $INSTDIR/osrframework/
cd $INSTDIR/osrframework/
python3 -m venv $INSTDIR/osrframework/osrframework-venv
source osrframework-venv/bin/activate
pip3 install pip==21.2
pip3 install osrframework
pip3 install 'urllib3<2'
deactivate
echo -e "$VERDE OSRFramework Installed $RC"


echo -e "$AZUL3 Installing eo-ripper... $RC"
git clone https://github.com/Quantika14/email-osint-ripper.git $INSTDIR/eo-ripper/
cd $INSTDIR/eo-ripper/
python3 -m venv $INSTDIR/eo-ripper/eo-ripper-venv
source eo-ripper-venv/bin/activate
pip3 install -r requeriments.txt
pip3 install requests
deactivate
echo -e "$VERDE eo-ripper Installed $RC"


echo -e "$AZUL3 Installing Instaloader... $RC"
mkdir -p $INSTDIR/instaloader/
cd $INSTDIR/instaloader/
python3 -m venv $INSTDIR/instaloader/instaloader-venv
source instaloader-venv/bin/activate
pip3 install instaloader
deactivate
echo -e "$VERDE Instaloader Installed $RC"


echo -e "$AZUL3 Installing GHunt... $RC"
git clone https://github.com/mxrch/ghunt $INSTDIR/GHunt
cd  $INSTDIR/GHunt
python3 -m venv $INSTDIR/GHunt/GHunt-venv
source GHunt-venv/bin/activate
pip3 install pipx
pipx ensurepath
pipx install ghunt
deactivate
echo -e "$VERDE GHunt Installed $RC"
echo -e "$RC" 


echo -e "$AZUL3 Installing Ivre... $RC"
mkdir  $INSTDIR/Ivre/
cd $INSTDIR/Ivre/
python3 -m venv $INSTDIR/Ivre/Ivre-venv
source Ivre-venv/bin/activate
pip install ivre
deactivate
echo -e "$VERDE Ivre Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing TorBot... $RC"
git clone https://github.com/DedSecInside/TorBot.git  $INSTDIR/torbot/
cd  $INSTDIR/torbot
python3 -m venv $INSTDIR/torbot/torbot-venv
source torbot-venv/bin/activate
pip3 install -r requirements.txt
python3 torbot -u https://www.example.com
deactivate
echo -e "$VERDE TorBot Installed $RC"
echo -e "$RC"


echo -e "$AZUL3 Installing ProtOSINT... $RC"
git clone https://github.com/pixelbubble/ProtOSINT.git $INSTDIR/protosint/
cd  $INSTDIR/protosint/
python3 -m venv $INSTDIR/protosint/protosint-venv
source protosint-venv/bin/activate
pip3 install -r requirements.txt
pip3 install requests
deactivate
echo -e "$VERDE Instaloader Installed $RC"


sudo mkdir -p /usr/share/sherlock-menu/
sudo cp $SCRIPT_DIR/scripts/exec-in-shell /usr/share/sherlock-menu/
sudo chmod +x /usr/share/sherlock-menu/exec-in-shell

mkdir -p ~/iconos
sudo cp $SCRIPT_DIR/menu/iconos/* ~/iconos/

mkdir -p ~/.local/share/applications/
sudo cp $SCRIPT_DIR/menu/desktop/*.desktop ~/.local/share/applications/

mkdir -p ~/.config/menus/
sudo mv /etc/xdg/menus/xfce-applications.menu ~/.config/menus/xfce-applications.menuBACKUP
sudo cp $SCRIPT_DIR/menu/xfce-applications.menu ~/.config/menus/

mkdir -p ~/.local/share/desktop-directories/
cp $SCRIPT_DIR/menu/desktop-directories/*.directory ~/.local/share/desktop-directories/

sudo cp $SCRIPT_DIR/scripts/* /usr/bin/


sudo chmod +x /usr/bin/certgraph
sudo chmod +x /usr/bin/bbot
sudo chmod +x /usr/bin/cloudfail
sudo chmod +x /usr/bin/CloudScraper
sudo chmod +x /usr/bin/EyeWitness
sudo chmod +x /usr/bin/ghunt
sudo chmod +x /usr/bin/gitrecon
sudo chmod +x /usr/bin/hostintel
sudo chmod +x /usr/bin/infoga
sudo chmod +x /usr/bin/ivre
sudo chmod +x /usr/bin/MrHolmes
sudo chmod +x /usr/bin/pagodo
sudo chmod +x /usr/bin/photon
sudo chmod +x /usr/bin/sherlock
sudo chmod +x /usr/bin/scanless
sudo chmod +x /usr/bin/startYACY
sudo chmod +x /usr/bin/stopYACY
sudo chmod +x /usr/bin/theHarvester
sudo chmod +x /usr/bin/torbot
sudo chmod +x /usr/bin/xray
sudo chmod +x /usr/bin/dnsrecon
sudo chmod +x /usr/bin/exiftool
sudo chmod +x /usr/bin/metagoofil
sudo chmod +x /usr/bin/sf
sudo chmod +x /usr/bin/sfcli
sudo chmod +x /usr/bin/osrf
sudo chmod +x /usr/bin/eo-ripper
sudo chmod +x /usr/bin/instaloader
sudo chmod +x /usr/bin/protosint


echo -e "$VERDE Menus and shortcuts created $RC"
echo -e "$RC"


echo -e "$COLOROFF"
sudo apt autoremove -y --purge
sudo apt clean -y
sudo journalctl --vacuum-time=3d
sudo apt remove -y $(dpkg-query --show 'linux-modules-*' | cut -f1 | grep -v "$(uname -r)")
sudo find /var/log/ -type f -exec cp /dev/null {} \;
rm -rf ~/.cache/*
cat /dev/null > ~/.bash_history


echo -e "$AZUL3 The system will then restart to apply the latest changes."
echo -e "$NARANJA Press enter to continue"
read -p ""
systemctl reboot
