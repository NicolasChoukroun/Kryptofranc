#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

echo "--------------------------------------------------------------"
echo -e "$BCyan bitFranc Installer: version 1.25"
echo -e "$BBlue installer [option1] [option2] [option3] [option3]"
echo -e "$BGreen  win       compile for Windows os "
echo -e "  unix      compile for Unix (default)"
echo -e "  all       do all options at a time (default = no)"
echo -e "  install   install and update the dependencies (default = no)"
echo -e "  clone     copy the clean bitcoin folder to the working one (default = no)"
echo -e "  extras    install extras (vsftpd for example) (default = no)"
echo -e "  noexec    do not execute the wallet at the end (default = no)"
echo -e "  copy      update the bitcoin directory with the assets_installer changes (default = no)"
echo
echo -e "$BYellow example: ./installer.sh install noexec clone copy"
echo "  ->will compile for unix, install qt, git db4 etc.. clone git bitcoin, and copy the bifFranc changes over it."
echo "--------------------------------------------------------------"
echo -e $Color_Off

# initialize the internal variables
OS="unix"
INSTALL="no"
COPY="no"
CLONE="no"
EXTRAS="no"
NOEXEC="no"

# test the number max of options
if [ "$#" = 0 ] ; then
   	echo -e "$BRed no option selected: exiting..."
	echo -e $Color_Off
        exit;
fi
if [ "$#" -ge 5 ]  ; then
	echo -e "$BRed Error: too many parameters (5 max)"
	echo -e $Color_Off
	exit
fi

# loop through all the options and set the corresponding variables
while [ "$1" != "" ]; do
	case $1 in
	    all)
		OS="unix"
		INSTALL="yes"
		COPY="yes"
		CLONE="yes"
		EXTRAS="no"
		NOEXEC="yes"
	      ;;
	    win)
	    	OS="windows"
	     ;;
	    copy)
	    	COPY="yes"
	     ;;
	    install)
	    	INSTALL="yes"
	     ;;
	    clone)
	    	CLONE="yes"
	     ;;
	    noexec)
	    	NOEXEC="yes"
	     ;;
	    extras)
	    	EXTRAS="yes"
	     ;;
	    help)
	    	exit
	    ;;
	esac
	shift
done

echo -e "$BYellow --------------------------------------------------"
echo " *** EXECUTING SCRIPT WITH OPTIONS ***"
echo "OS option $OS"
echo "INSTALL option $INSTALL"
echo "COPY option $COPY"
echo "CLONE option $CLONE"
echo "EXTRAS option  $EXTRAS"
echo "NOEXEC option $NOEXEC"
echo "--------------------------------------------------"
echo -e $Color_Off



if [ $INSTALL = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Install option executing (install option is on)..."
    echo -e $Color_Off

    sudo apt-get --assume-yes update
    sudo apt-get --assume-yes upgrade
    sudo apt-get --assume-yes install git
    sudo apt-get --assume-yes install build-essential
    sudo apt-get --assume-yes install qt5-default qttools5-dev-tools
    sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module
    
fi

if [ $CLONE = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Copy the clean bitcoin folder the the working one (clone option is on)..."
    echo -e $Color_Off
    sudo rm -r -f ~/bitcoin
    sudo cp -r bitcoin ~/ 
    
    # do not clone systematically or it ask to merge with the latest Bitcoin core release.
    # sudo rm -r -f bitcoin    
    # sudo git clone https://github.com/bitcoin/bitcoin 
    # exit;
fi

if [ $EXTRAS = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Extras Installation..."
    echo -e $Color_Off
    
    sudo apt update
    sudo apt-get --assume-yes install hardinfo
    sudo apt --assume-yes install software-center*
    sudo apt-get --assume-yes install git-core
    #git.config --global.username "bitFranc"
    #echo -e "$BBlue I need you GIT user email so that later on you push with your name:"
    #read GITUSER
    #echo -e $Color_Off
    #if [ -z $GITUSER ]; then
#	echo -e "$BRed Error: Git user cannot be empty"
#	echo -e $Color_Off
#	exit
#    fi  
#    git.config --global user.email $GITUSER
    snap install ubuntu-mate-welcome --classic
    snap install software-boutique --classic
    snap install pulsemixer
    sudo apt install vsftpd
    sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
    sudo ufw allow 20/tcp
    sudo ufw allow 21/tcp
    sudo ufw allow 990/tcp
    sudo ufw allow 40000:50000/tcp
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
    echo -e "$BBlue Please enter a login/user for the FTP:"
    read FTPLOGIN
    if [ -z $FTPLOGIN ]; then
    	echo -e "$BRed Error: FTP Login cannot be empty"
	echo -e $Color_Off
	exit
    fi
    echo -e $Color_Off
    echo -e "$BBlue Please enter a path for the FTP (ex:/home or /mnt/fsc):"
    read FTPPATH
    if [ -z $FTPPATH ]; then
    	echo -e "$BRed Error: FTP Path cannot be empty"
	echo -e $Color_Off
	exit
    fi
    echo -e $Color_Off
 
    sudo deluser $FTPLOGIN   
    mkdir -v -p $FTPPATH/$FTPLOGIN/ftp
    mkdir -v -p $FTPPATH/$FTPLOGIN/http
    sudo chmod +rw $FTPPATH/$FTPLOGIN/ftp
    sudo chmod +rw $FTPPATH/$FTPLOGIN/http
    sudo adduser $FTPLOGIN     sudo chown nobody:nogroup $FTPPATH/$FTPLOGIN/ftp
    sudo chown nobody:nogroup $FTPPATH/$FTPLOGIN/http
    sudo usermod -d $FTPPATH/$FTPLOGIN/ftp/ $FTPLOGIN
    #sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
    sudo cp assets_installer/vsftpd.conf /etc/vsftpd.conf
    sudo cp assets_installer/vsftpd.pem /etc/ssl/private/vsftpd.pem
    echo "$FTPLOGIN" | sudo tee -a /etc/vsftpd.userlist
    sudo systemctl restart vsftpd

fi



if [ $COPY = "yes" ]; then
    $MOD="-u"
fi

echo -e "$BYellow --------------------------------------------------"
echo -e "$BGreen Copy option executing with $MOD parameter..."
echo -e $Color_Off

sudo cp $MOD assets_installer/bitfranc_replace/modaloverlay.ui ~/bitcoin/src/qt/forms/
sudo cp $MOD assets_installer/bitfranc_replace/overviewpage.ui ~/bitcoin/src/qt/forms/
sudo cp	$MOD assets_installer/bitfranc_replace/feature_help.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/interface_bitcoin_cli.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/update-translations.py ~/bitcoin/contrib/devtools/
sudo cp $MOD assets_installer/bitfranc_replace/mempool_persist.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/interface_rest.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/mininode.py ~/bitcoin/test/functional/test_framework/
sudo cp $MOD assets_installer/bitfranc_replace/rpc_fundrawtransaction.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/rpc_rawtransaction.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/test_runner.py ~/bitcoin/test/functional/
sudo cp $MOD assets_installer/bitfranc_replace/wallettests.cpp ~/bitcoin/src/qt/test/
sudo cp $MOD assets_installer/bitfranc_replace/wallet_tests.cpp ~/bitcoin/src/wallet/test/

sudo cp $MOD assets_installer/bitfranc_replace/guiutil.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/addressbookpage.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/openuridialog.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/paymentserver.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/sendcoinsdialog.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/utilitydialog.cpp ~/bitcoin/src/qt/
sudo cp	$MOD assets_installer/bitfranc_replace/editaddressdialog.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/bitcoin.cpp ~/bitcoin/src/qt/
sudo cp	$MOD assets_installer/bitfranc_replace/bitcoingui.cpp ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitfranc_replace/intro.cpp ~/bitcoin/src/qt/

sudo cp $MOD assets_installer/bitfranc_replace/askpassphrasedialog.cpp ~/bitcoin/src/qt/forms/

sudo cp $MOD assets_installer/bitfranc_replace/rpcdump.cpp ~/bitcoin/src/wallet/
sudo cp $MOD assets_installer/bitfranc_replace/rpcwallet.cpp ~/bitcoin/src/wallet/
sudo cp	$MOD assets_installer/bitfranc_replace/db.cpp ~/bitcoin/src/wallet/

sudo cp	$MOD assets_installer/bitfranc_replace/blockchain.cpp ~/bitcoin/src/rpc/
sudo cp $MOD assets_installer/bitfranc_replace/mining.cpp ~/bitcoin/src/rpc/
sudo cp $MOD assets_installer/bitfranc_replace/misc.cpp ~/bitcoin/src/rpc
sudo cp $MOD assets_installer/bitfranc_replace/net2.cpp ~/bitcoin/src/rpc/
sudo mv ~/bitcoin/src/rpc/net2.cpp ~/bitcoin/src/rpc/net.cpp
sudo cp $MOD assets_installer/bitfranc_replace/rawtransaction.cpp ~/bitcoin/src/rpc/
sudo cp $MOD assets_installer/bitfranc_replace/server.cpp ~/bitcoin/src/rpc/

sudo cp $MOD assets_installer/bitfranc_replace/amount.h ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/bitcoin-cli.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/bitcoind.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/chainparams.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/chainparamsbase.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/init.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/key.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/net.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/pow.cpp ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/util.h ~/bitcoin/src/
sudo cp $MOD assets_installer/bitfranc_replace/validation.cpp ~/bitcoin/src/

sudo rm -rf ~/bitcoin/src/qt/locale
sudo cp $MOD -R assets_installer/locale ~/bitcoin/src/qt/
sudo cp $MOD assets_installer/bitcoin.png ~/bitcoin/src/qt/res/icons/bitcoin.png
sudo cp $MOD assets_installer/bitcoin.ico ~/bitcoin/src/qt/res/icons/bitcoin.ico

if [ $INSTALL = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Install and configure DB4..."
    echo -e $Color_Off
    
    sudo mkdir ~/bitcoin/db4/
    cd ~/bitcoin/db4
    sudo wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
    sudo tar -xzvf db-4.8.30.NC.tar.gz
    sudo rm -rf db-4.8.30.NC.tar.gz
    DB4_PATH=$PWD
    cd db-4.8.30.NC/build_unix
    sudo ../dist/configure --enable-cxx --disable-shared --with-pic --prefix=$DB4_PATH
    @sudo make install --quiet
fi

if [ $OS = "win" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Windows specific settings"
    echo -e $Color_Off

    cd ~/bitcoin/depends
    CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site
    sudo update-alternatives --set x86_64-w64-mingw32-g++ /usr/bin/x86_64-w64-mingw32-g++-posix
    sudo make HOST=x86_64-w64-mingw32
fi
if [ $OS = "unix" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Unix libraries and specific installs"
    echo -e $Color_Off

    sudo apt-get install libzmq3-dev
    sudo apt-get install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools 
    sudo apt-get install libprotobuf-dev protobuf-compiler
    sudo apt-get install libqrencode-dev
fi

if [ $INSTALL = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Create the Make file and configs (autogen.sh)..."
    echo -e $Color_Off
    
    cd ~/bitcoin
    sudo ./autogen.sh
    sudo ./configure LDFLAGS="-L$DB4_PATH/lib/" CPPFLAGS="-I$DB4_PATH/include/"
    sudo sed -i -e 's/bitcoin/bitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
    sudo sed -i -e 's/Bitcoin/BitFranc/g' ~/bitcoin/src/config/bitcoin-config.h
    sudo sed -i -e 's/BITCOIN/BITFRANC/g' ~/bitcoin/src/config/bitcoin-config.h
    sudo sed -i -e 's/bitcoins/bitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
    sudo sed -i -e 's/Bitcoins/BitFrancs/g' ~/bitcoin/src/config/bitcoin-config.h
    sudo sed -i -e 's/BITCOINS/BITFRANCS/g' ~/bitcoin/src/config/bitcoin-config.h

    sudo sed -i -e 's/bitcoin/bitFranc/g' ~/bitcoin/build_msvc/bitcoin_config.h
    sudo sed -i -e 's/Bitcoin/BitFranc/g' ~/bitcoin/build_msvc/bitcoin_config.h
    sudo sed -i -e 's/BITCOIN/BITFRANC/g' ~/bitcoin/build_msvc/bitcoin_config.h
    sudo sed -i -e 's/bitcoins/bitFrancs/g' ~/bitcoin/build_msvc/bitcoin_config.h
    sudo sed -i -e 's/Bitcoins/BitFrancs/g' ~/bitcoin/build_msvc/bitcoin_config.h
    sudo sed -i -e 's/BITCOINS/BITFRANCS/g' ~/bitcoin/build_msvc/bitcoin_config.h

fi

sudo -R 777 ~/bitcoin
sudo -R 777 ~/kryptofranc

cd ~/bitcoin
sudo make

sudo mv ~/bitcoin/src/bitcoind ~/bitcoin/src/bitfrancd
sudo mv	~/bitcoin/src/bitcoin-tx ~/bitcoin/src/bitfranc-tx
sudo mv	~/bitcoin/src/bitcoin-cli ~/bitcoin/src/bitfranc-cli
sudo mv	~/bitcoin/src/qt/bitcoin-qt ~/bitcoin/src/qt/bitfranc-qt

if [ $NOEXEC = "no" ]; then
    ~/bitcoin/src/qt/./bitfranc-qt
fi
exit;
