#!/bin/bash -xv
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module
#git clone https://github.com/bitcoin/bitcoin.git

INSTALL_PWD_TMP=$PWD
sudo cp -r ../bitcoin ~/
sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp -R locale ~/bitcoin/src/qt/
sudo cp bitcoin-config.h ~/bitcoin/src/config/
sudo cp bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install qt5-default qttools5-dev-tools

sudo mkdir ~/bitcoin/db4/
cd ~/bitcoin/db4
sudo wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
sudo tar -xzvf db-4.8.30.NC.tar.gz
rm -rf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=~/bitcoin/db4/
sudo make install

cd ~/bitcoin/depends
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
sudo make HOST=x86_64-w64-mingw32
cd ~/bitcoin/

sudo ./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site
sudo ./configure LDFLAGS="-L~/bitcoin/db4/lib/" CPPFLAGS="-I~/bitcoin/db4/include/"
sudo cp $INSTALL_PWD_TMP/bitcoin_config.h ~/bitcoin/build_msvc/bitcoin_config.h
sudo make
