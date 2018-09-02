sudo apt-get --assume-yes update
sudo apt-get --assume-yes install git
mkdir src
#git clone https://github.com/bitcoin/bitcoin.git
cp -r ../bitcoin ./src
cd src
rm -rf bitcoin/src/qt/locale
cp -R ../locale bitcoin/src/qt/
cp ../bitcoin-config.h bitcoin/src/config/
cp ../bitcoin.png bitcoin/src/qt/res/icons/bitcoin.png
cp ../bitcoin.ico bitcoin/src/qt/res/icons/bitcoin.ico
sudo apt-get --assume-yes install build-essential
wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
tar -xvf db-4.8.30.NC.tar.gz
rm -rf db-4.8.30.NC.tar.gz
cd db-4.8.30.NC/build_unix
mkdir -p build
BDB_PREFIX=$(pwd)/build
sudo ../dist/configure --disable-shared --enable-cxx --with-pic --prefix=$BDB_PREFIX
sudo make install
cd ../..
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module

cd bitcoin/depends
sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
cd ..
sudo ./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
cp ../bitcoin_config.h build_msvc/bitcoin_config.h
sudo make
