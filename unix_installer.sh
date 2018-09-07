#!/bin/bash
echo "-----------------------------------------------------------"
echo "bitFranc Installer: UNIX version 1.1"
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
sudo cp assets_installer/tmp/modaloverlay.ui ~/bitcoin/src/qt/forms/
sudo cp assets_installer/tmp/overviewpage.ui ~/bitcoin/src/qt/forms/
sudo cp assets_installer/tmp/guiutil.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/update-translations.py ~/bitcoin/contrib/devtools/
sudo cp assets_installer/tmp/bitcoin-cli.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/bitcoind.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/init.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/key.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/net.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/util.h ~/bitcoin/src/
sudo cp assets_installer/tmp/validation.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/addressbookpage.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/askpassphrasedialog.cpp ~/bitcoin/src/qt/forms/
sudo cp assets_installer/tmp/bitcoin.cpp ~/bitcoin/src/qt/
sudo cp	assets_installer/tmp/bitcoingui.cpp ~/bitcoin/src/qt/
sudo cp	assets_installer/tmp/blockchain.cpp ~/bitcoin/src/rpc/
sudo cp	assets_installer/tmp/db.cpp ~/bitcoin/src/wallet/
sudo cp	assets_installer/tmp/editaddressdialog.cpp ~/bitcoin/src/qt/
sudo cp	assets_installer/tmp/feature_help.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/interface_bitcoin_cli.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/interface_rest.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/intro.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/mempool_persist.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/mining.cpp ~/bitcoin/src/rpc/
sudo cp assets_installer/tmp/mininode.py ~/bitcoin/test/functional/test_framework/
sudo cp assets_installer/tmp/misc.cpp ~/bitcoin/src/rpc/
sudo cp assets_installer/tmp/net2.cpp ~/bitcoin/src/rpc/
sudo mv ~/bitcoin/test/functional/net2.cpp ~/bitcoin/src/rpc/net.cpp
sudo cp assets_installer/tmp/openuridialog.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/paymentserver.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/rawtransaction.cpp ~/bitcoin/src/rpc/
sudo cp assets_installer/tmp/rpcdump.cpp ~/bitcoin/src/wallet/
sudo cp assets_installer/tmp/rpc_fundrawtransaction.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/rpc_rawtransaction.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/rpcwallet.cpp ~/bitcoin/src/wallet/
sudo cp assets_installer/tmp/sendcoinsdialog.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/server.cpp ~/bitcoin/src/rpc/
sudo cp assets_installer/tmp/test_runner.py ~/bitcoin/test/functional/
sudo cp assets_installer/tmp/utilitydialog.cpp ~/bitcoin/src/qt/
sudo cp assets_installer/tmp/wallettests.cpp ~/bitcoin/src/qt/test/
sudo cp assets_installer/tmp/wallet_tests.cpp ~/bitcoin/src/wallet/test/
sudo cp assets_installer/tmp/amount.h ~/bitcoin/src/
sudo cp assets_installer/tmp/chainparams.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/chainparamsbase.cpp ~/bitcoin/src/
sudo cp assets_installer/tmp/pow.cpp ~/bitcoin/src/

sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp -R assets_installer/locale ~/bitcoin/src/qt/
sudo cp assets_installer/bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp assets_installer/bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico

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
sudo ./autogen.sh
sudo ./configure LDFLAGS="-L$DB4_PATH/lib/" CPPFLAGS="-I$DB4_PATH/include/"
sudo sed -i -e 's/bitcoin/bitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/Bitcoin/BitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/BITCOIN/BITFRANC/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/bitcoins/bitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/Bitcoins/BitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
sudo sed -i -e 's/BITCOINS/BITFRANCS/g' ~/bitcoin/src/config/bitcoin-config.h

sudo make

sudo mv ~/bitcoin/src/bitcoind ~/bitcoin/src/bitfrancd
sudo mv	~/bitcoin/src/bitcoin-tx ~/bitcoin/src/bitfranc-tx
sudo mv	~/bitcoin/src/bitcoin-cli ~/bitcoin/src/bitfranc-cli
sudo mv	~/bitcoin/src/qt/bitcoin-qt ~/bitcoin/src/qt/bitfranc-qt










