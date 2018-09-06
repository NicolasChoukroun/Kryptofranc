#!/bin/bash -xv
echo "-----------------------------------------------------------"
echo "bitFranc Installer: WINDOWS version 1.0"
echo "Options:"
echo "  - git=yes": will clone bitcoin and recompile all
echo "-----------------------------------------------------------"

sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install qt5-default qttools5-dev-tools
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module

#if [ $opt -git yes ]; then
#  git clone https://github.com/bitcoin/bitcoin.git
#fi

INSTALL_PWD_TMP=$PWD
sudo cp -r ../bitcoin ~/
sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp -R locale ~/bitcoin/src/qt/
sudo cp Bitfranc_installer/bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp Bitfranc_installer/bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico

sudo mkdir ~/bitcoin/db4/
cd ~/bitcoin/db4
sudo wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
sudo tar -xzvf db-4.8.30.NC.tar.gz
rm -rf db-4.8.30.NC.tar.gz
DB4_PATH=$PWD
cd db-4.8.30.NC/build_unix
sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$DB4_PATH
sudo make install

cd ~/bitcoin/depends
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
sudo make HOST=x86_64-w64-mingw32
cd ~/bitcoin/

sudo ./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site
sudo ./configure LDFLAGS="-L$DB4_PATH/lib/" CPPFLAGS="-I$DB4_PATH/include/"
sed -i -e 's/bitcoin/bitFranc/g' ~/bitcoin/src/config/bitcoin_config.h
sed -i -e 's/Bitcoin/BitFranc/g' ~/bitcoin/src/config/bitcoin_config.h
sed -i -e 's/BITCOIN/BITFRANC/g' ~/bitcoin/src/config/bitcoin_config.h
sudo make
