#!/bin/bash
echo "-----------------------------------------------------------"
echo "bitFranc Installer: WINDOWS version 1.1"
echo "Options:"
echo "  - git=yes": will clone bitcoin and recompile all
echo "-----------------------------------------------------------"

sudo apt-get --assume-yes update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install git
sudo apt-get --assume-yes install build-essential
sudo apt-get --assume-yes install qt5-default qttools5-dev-tools
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module

if [ $opt -git yes ]; then
  git clone https://github.com/bitcoin/bitcoin.git
fi

sudo cp -r bitcoin ~/
sudo sed -i -e 's/to spend bitcoins that are/to spend bitfrancs that are/g' ~/bitcoin/src/qt/forms/modaloverlay.ui
sudo sed -i -e 's/with the bitcoin network/with the bitfranc network/g' ~/bitcoin/src/qt/forms/modaloverlay.ui
sudo sed -i -e 's/to spend bitcoins that/to spend bitfrancs that/g' ~/bitcoin/src/qt/forms/modaloverlay.ui
sudo sed -i -e 's/with the Bitcoin network/with the bitfranc network/g' ~/bitcoin/src/qt/forms/overviewpage.ui
sudo sed -i -e 's/Enter a Bitcoin address/Enter a Bitfranc address/g' ~/bitcoin/src/qt/guiutil.cpp

sudo sed -i -e 's/contains a bitcoin/contains a bitfranc/g' ~/bitcoin/contrib/devtools/update-translations.py
sudo sed -i -e 's/bitcoind/bitfrancd/g' ~/bitcoin/src/bitcoin-cli.cpp
sudo sed -i -e 's/bitcoin-cli/bitfranc-cli/g' ~/bitcoin/src/bitcoin-cli.cpp
sudo sed -i -e 's/bitcoin-tx/bitfranc-tx/g' ~/bitcoin/src/bitcoin-cli.cpp
sudo sed -i -e 's/bitcoind/bitfrancd/g' ~/bitcoin/src/bitcoind.cpp
sudo sed -i -e 's/Bitcoin/Bitfranc/g' ~/bitcoin/src/bitcoind.cpp
#sudo sed -i -e 's/"https://github.com/bitcoin/bitcoin"/"https://github.com/bitFranc/bitFranc"/g' ~/bitcoin/src/init.cpp                                                                                    
#sudo sed -i -e 's/"https://bitcoincore.org"/"http://fcoin.org/"/g' ~/bitcoin/src/init.cpp                                                                                                                  
sudo sed -i -e 's/if bitcoin is/if bitfranc is/g' ~/bitcoin/src/init.cpp
sudo sed -i -e 's/Bitcoin key/Bitfranc key/g' ~/bitcoin/src/key.cpp
sudo sed -i -e 's/Bitcoin /Bitfranc /g' ~/bitcoin/src/net.cpp
sudo sed -i -e 's/bitcoin-%s/bitfranc-%s/g' ~/bitcoin/src/util.h
sudo sed -i -e 's/Bitcoin Signed Message/Bitfranc Signed Message/g' ~/bitcoin/src/validation.h
sudo sed -i -e 's/are your Bitcoin/are your Bitfranc/g' ~/bitcoin/src/qt/addressbookpage.cpp
sudo sed -i -e 's/are your Bitcoin/are your Bitfranc/g' ~/bitcoin/src/qt/addressbookpage.cpp
sudo sed -i -e 's/are your Bitcoin/are your Bitfranc/g' ~/bitcoin/src/qt/addressbookpage.cpp
sudo sed -i -e 's/are your Bitcoin/are your Bitfranc/g' ~/bitcoin/src/qt/addressbookpage.cpp

sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp -R assets_installer/locale ~/bitcoin/src/qt/
sudo cp assets_installer/bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp assets_installer/bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico

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
sudo sed -i -e 's/bitcoin/bitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/Bitcoin/BitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/BITCOIN/BITFRANC/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/bitcoins/bitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/Bitcoins/BitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/BITCOINS/BITFRANCS/g' ~/bitcoin/src/config/bitcoin-config.h
sudo make
