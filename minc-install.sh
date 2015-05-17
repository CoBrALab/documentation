#!/bin/bash
#File to install minc-toolkit on neurodebian
set -e
wget -c http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.01-20131211-Debian_7.1-x86_64.deb
wget -c http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/bic-mni-models-0.1.1-20120421.deb
wget -c http://ftp.us.debian.org/debian/pool/main/libj/libjpeg8/libjpeg8_8d-1+deb7u1_amd64.deb
wget -c http://ftp.us.debian.org/debian/pool/main/t/tiff3/libtiff4_3.9.6-11_amd64.deb
wget -c http://download1.rstudio.org/rstudio-0.98.1103-amd64.deb
wget -c https://github.com/Mouse-Imaging-Centre/RMINC/archive/v1.2.4.9.tar.gz
#wget -c http://cobralab.net/files/classic-vbm-example.tar.bz2
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get -y --force-yes install libc6 libstdc++6 imagemagick perl freeglut3 libgl1-mesa-glx libxcb1 libxdmcp6 libx11-6 libxext6 libxau6 libuuid1 libjpeg62 libexpat1 libtiff5 \
autogen autoconf r-recommended libnetcdf-dev libhdf5-dev minc-tools python-setuptools cython python-numpy
sudo dpkg -i *.deb
sudo apt-get -f -y --force-yes install 

echo ". /opt/minc/minc-toolkit-config.sh" >> ~/.bashrc

. /opt/minc/minc-toolkit-config.sh

sudo sed -i 's/CC = gcc -std=gnu99/CC = h5cc -std=gnu99/g' /etc/R/Makeconf
sudo R CMD INSTALL v1.2.4.9.tar.gz --configure-args='--with-build-path=/opt/minc'

git clone --recursive https://github.com/Mouse-Imaging-Centre/minc-stuffs.git
cd minc-stuffs
touch README
./autogen.sh
CC=h5cc ./configure --with-build-path=/opt/minc
make
sudo make install
sudo python setup.py install

#mkdir classic-example
#tar -xjf classic-vbm-example.tar.bz2 -C classic-example

echo "Install complete, either run "source ~/.bashrc" or close and reopen the terminal to have access to the newly installed software"
