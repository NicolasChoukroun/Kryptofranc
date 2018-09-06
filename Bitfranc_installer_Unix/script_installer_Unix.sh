#!/bin/bash -xv
sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install qt5-default qttools5-dev-tools
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module

INSTALL_PWD_TMP=$PWD
sudo cp -r bitcoin ~/
sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp -R Bitfranc_installer/locale ~/bitcoin/src/qt/
sudo cp Bitfranc_installer/bitcoin-config.h ~/bitcoin/src/config/
sudo cp Bitfranc_installer/bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp Bitfranc_installer/bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico

sudo mkdir ~/bitcoin/db4/
cd ~/bitcoin/db4
sudo wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
sudo tar -xzvf db-4.8.30.NC.tar.gz
sudo rm -rf db-4.8.30.NC.tar.gz
DB4_PATH=$PWD
cd db-4.8.30.NC/build_unix
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$DB4_PATH
sudo make install

cd ~/bitcoin
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module

sudo ./autogen.sh
sudo ./configure LDFLAGS="-L$DB4_PATH/lib/" CPPFLAGS="-I$DB4_PATH/include/"
sudo cp $INSTALL_PWD_TMP/bitcoin-config.h ~/bitcoin/src/config/bitcoin-config.h
sudo make
