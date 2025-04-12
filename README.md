![LogoREADME](https://github.com/7069wrk/SherlockLinux/assets/137631572/06261dae-d3d1-4748-9b50-c7f8d07e6338)

[![Python Version](https://img.shields.io/badge/python-3.9+-FF8400)](https://www.python.org) [![License](https://img.shields.io/badge/license-GPLv3-FF8400.svg)](https://github.com/blacklanternsecurity/bbot/blob/dev/LICENSE) [![version](https://img.shields.io/badge/version-1.0.0-green.svg)](https://semver.org)

# Sherlock Linux 
### https://www.sherlock-linux.org/
### OSINT distribution based on Debian 12 and XFCE desktop environment.

- A large number of pre-installed tools for obtaining information from open sources for OSINT investigations.
- Preconfigured browsers with the best resources for OSINT investigations.
- Desktop environment designed to have all tools accessible by categories.
- 
### [Download](https://www.sherlock-linux.org/descarga/) SHERLOCK LINUX.

- Username: sherlock
- Secret: sherlock


### O ...

### INSTALL SHERLOCK LINUX

This script has been tested only on a Debian 12 distribution with XFCE desktop environment.

1º Create the user sherlock and add it to sudoers:
~~~bash
su -l
apt install sudo
adduser sherlock sudo
echo 'sherlock  ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
su sherlock

#NOTE: you dont need to do the above if you are already in a running OS, just make sure that your user account has the proper access
~~~

2º Install Git and Clone the repository:
~~~bash
sudo apt install git
#clone from original Spanish repository
git clone https://github.com/SherlockLinux/SherlockLinux.git ~/SherlockLinux
#clone from this repository
git clone https://github.com/7069wrk/SherlockLinux.git ~/SherlockLinux
~~~

3º Giving execution permissions to the Sherlock Linux script
~~~bash
sudo chmod +x ~/SherlockLinux/SherlockLinux.sh
~~~

4º Execute the script
~~~bash
cd ~/SherlockLinux/
./SherlockLinux.sh
~~~

#### Installation begins...

<img width="600" alt="Sherlock linux install" src="https://github.com/7069wrk/SherlockLinux/assets/137631572/e69db155-e71f-47a8-b2c4-9a481900174d">

# INSTALLED TOOLS

- Bbot
- Certgraph
- Cloud Fail
- Cloud Scraper
- DNS Recon
- EO Ripper
- ExifTool
- EyeWitness
- Git Recon
- Hostintel
- HTTrack
- Infoga
- Instaloader
- Maltego
- Metagoofil
- OSRFramework
 -  Alias_generator
 -  Checkfy
 -  Domainfy
 -  Mailfy
 -  Phonefy
 -  Searchfy
 -  Usufy
- Pagodo
- Phone infoga
- Photon
- Protosint
- Scanless
- Sherlock
- Spiderfoot CLI
- Spiderfoot GUI
- TheHarvester
- WhatWeb
- XRay
- Yacy
- ...

You can see [here](https://www.sherlock-linux.org/documentacion/) the complete list of tools.

# DESKTOP

![sherlockLaptop](https://github.com/7069wrk/SherlockLinux/assets/137631572/68b55045-c4b7-4bdf-8984-cf3e142d284e)


# YOUTUBE
[Video presentation](https://youtu.be/iRYdHMKkxa4)


# CONTACT
📫 [Contact](https://www.sherlock-linux.org/contacto/)

# DISCLAIMER

- THE INSTALLATION SCRIPT MAKES SO-LEVEL CHANGES THAT MAY DAMAGE THE OPERATING SYSTEM, RUN THE SCRIPT IN A CONTROLLED ENVIRONMENT AT YOUR OWN RISK.
- THIS SOFTWARE IS DISTRIBUTED FREE OF CHARGE UNDER GPL-3 LICENSE AND IS NOT GUARANTEED TO WORK ON DIFFERENT VERSIONS OF LINUX.
- THIS REPOSITORY WAS CONVERTED TO ENGLISH (mostly) AND ALL LINKS REDIRECTED; EXCEPT THOSE GIVING CREDIT TO ORIGINAL CREATORS RESOURCES.


