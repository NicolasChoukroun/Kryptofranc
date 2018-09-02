sudo apt-get --assume-yes update
sudo apt-get --assume-yes install git
mkdir src
#git clone https://github.com/bitcoin/bitcoin.git
cp ../bitcoin src/
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
sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobu\
f-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module
cd bitcoin
git checkout v0.16.0
sudo ./autogen.sh
sudo ./configure CPPFLAGS="-I${BDB_PREFIX}/include/ -O2" LDFLAGS="-L${BDB_PREFIX}/lib/" --with-gui
cp ../bitcoin_config.h build_msvc/bitcoin_config.h
sudo make
