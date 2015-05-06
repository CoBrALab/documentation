#File to install minc-toolkit on neurodebian
wget -c http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/minc-toolkit-1.0.01-20131211-Debian_7.1-x86_64.deb
wget -c http://packages.bic.mni.mcgill.ca/minc-toolkit/Debian/bic-mni-models-0.1.1-20120421.deb
sudo apt-get update
sudo apt-get -y --force-yes install libc6 libstdc++6 imagemagick perl freeglut3 libgl1-mesa-glx libxcb1 libxdmcp6 libx11-6 libxext6 libxau6 libuuid1 libjpeg62 libexpat1 libtiff5
sudo dpkg -i *.deb
sudo apt-get -f -y --force-yes install 

echo ". /opt/minc/minc-toolkit-config.sh" >> ~/.bashrc

. /opt/minc/minc-toolkit-config.sh
