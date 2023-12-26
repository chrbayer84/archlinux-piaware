#!/bin/bash

DL_DIR=archlinux-piaware
INST_DIR=/usr/share/piaware-builder
USR=`whoami`
echo ""
echo -e "\e[1;32mInstalling (if not already installed) following Build Tools \e[39m"
echo ""
echo -e "\e[1;95m   git fakeroot patch gcc make autoconf \e[39m"
echo ""
sleep 3
sudo pacman --needed -S git fakeroot patch gcc make autoconf

echo ""
echo -e "\e[1;95mCreating dedicated folder \e[39m" ${INST_DIR} "\e[39m"
echo -e "\e[1;32mThis folder will hold cloned source-code and built package \e[39m"
sleep 3
sudo mkdir ${INST_DIR}
sudo chown ${USR} ${INST_DIR}

git clone https://github.com/abcd567a/${DL_DIR} ${INST_DIR}/${DL_DIR}

echo ""
echo -e "\e[1;95mBuilding and Installing following packages \e[39m"
echo -e "\e[1;95mwhich are NOT available in Arch Linux repo \e[39m"
echo -e "\e[1;95m  tcllib tclx tcltls tcllauncher \e[39m"
echo ""
echo -e "\e[1;32mBuilding and Installing package tcllib \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcllib
cd tcllib
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tclx \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tclx
cd tclx
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing package tcltls \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcltls
cd tcltls
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing packages tcllauncher \e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://aur.archlinux.org/tcllauncher
cd tcllauncher
makepkg -si

echo ""
echo -e "\e[1;32mBuilding and Installing packages mlat-client\e[39m"
echo ""
sleep 2
cd ${INST_DIR}
git clone https://github.com/abcd567a/archlinux-mlat-client
cd archlinux-mlat-client
makepkg -si

echo ""
echo -e "\e[1;32mInstallation of Build Tools and Dependency packages completed \e[39m"
echo ""
echo -e "\e[1;95mNow Building package PIAWARE \e[39m"
echo ""
sleep 2
cd ${INST_DIR}/${DL_DIR}
makepkg -si

echo ""
echo ""
echo -e "\e[1;95mAll cloned source-code and built package are located in \e[0;39m"
echo -e "\e[1;95mdedicated folder \e[39m" ${INST_DIR} "\e[0;39m"
echo -e ""





