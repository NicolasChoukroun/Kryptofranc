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
echo -e "$BCyan kryptofranc Installer: version 1.25"
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
OLDCOPY="no"

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

    # sudo apt-get --assume-yes update
    # sudo apt-get --assume-yes upgrade
    # sudo apt-get --assume-yes install git
    sudo apt-get --assume-yes install build-essential
    sudo apt-get --assume-yes install qt5-default qttools5-dev-tools
    sudo apt-get --assume-yes install autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module
    
fi

if [ $CLONE = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Copy the clean bitcoin folder the the working one (clone option is on)..."
    echo -e $Color_Off
    sudo rm -r -f ~/kryptofranc/kryptofranccore
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
    #git.config --global.username "kryptofranc"
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


$MOD="-u"
if [ $OLDCOPY = "yes" ]; then
	echo -e "$BYellow --------------------------------------------------"
	echo -e "$BGreen Copy option executing with $MOD parameter..."
	echo -e $Color_Off

	sudo cp $MOD assets_installer/kryptofranc_replace/modaloverlay.ui ~/kryptofranc/kryptofranccore/src/qt/forms/
	sudo cp $MOD assets_installer/kryptofranc_replace/overviewpage.ui ~/kryptofranc/kryptofranccore/src/qt/forms/
	sudo cp $MOD assets_installer/kryptofranc_replace/interface_rest.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp	$MOD assets_installer/kryptofranc_replace/feature_help.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp $MOD assets_installer/kryptofranc_replace/interface_bitcoin_cli.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp $MOD assets_installer/kryptofranc_replace/update-translations.py ~/kryptofranc/kryptofranccore/contrib/devtools/
	sudo cp $MOD assets_installer/kryptofranc_replace/mempool_persist.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp $MOD assets_installer/kryptofranc_replace/mininode.py ~/kryptofranc/kryptofranccore/test/functional/test_framework/
	sudo cp $MOD assets_installer/kryptofranc_replace/rpc_fundrawtransaction.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp $MOD assets_installer/kryptofranc_replace/rpc_rawtransaction.py ~/kryptofranc/kryptofranccore/test/functional/
	sudo cp $MOD assets_installer/kryptofranc_replace/test_runner.py ~/kryptofranc/kryptofranccore/test/functional/
	# sudo cp $MOD assets_installer/kryptofranc_replace/wallettests.cpp ~/kryptofranc/kryptofranccore/src/qt/test/
	# sudo cp $MOD assets_installer/kryptofranc_replace/wallet_tests.cpp ~/kryptofranc/kryptofranccore/src/wallet/test/

	sudo cp $MOD assets_installer/kryptofranc_replace/addressbookpage.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/askpassphrasedialog.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp	$MOD assets_installer/kryptofranc_replace/editaddressdialog.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/bitcoin.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp	$MOD assets_installer/kryptofranc_replace/bitcoingui.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/intro.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/guiutil.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/openuridialog.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/paymentserver.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/sendcoinsdialog.cpp ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/kryptofranc_replace/utilitydialog.cpp ~/kryptofranc/kryptofranccore/src/qt/

	sudo cp	$MOD assets_installer/kryptofranc_replace/db.cpp ~/kryptofranc/kryptofranccore/src/wallet/
	sudo cp $MOD assets_installer/kryptofranc_replace/rpcdump.cpp ~/kryptofranc/kryptofranccore/src/wallet/
	sudo cp $MOD assets_installer/kryptofranc_replace/rpcwallet.cpp ~/kryptofranc/kryptofranccore/src/wallet/

	sudo cp	$MOD assets_installer/kryptofranc_replace/blockchain.cpp ~/kryptofranc/kryptofranccore/src/rpc/
	sudo cp $MOD assets_installer/kryptofranc_replace/mining.cpp ~/kryptofranc/kryptofranccore/src/rpc/
	sudo cp $MOD assets_installer/kryptofranc_replace/misc.cpp ~/kryptofranc/kryptofranccore/src/rpc
	sudo cp $MOD assets_installer/kryptofranc_replace/net2.cpp ~/kryptofranc/kryptofranccore/src/rpc/
	sudo mv ~/kryptofranc/kryptofranccore/src/rpc/net2.cpp ~/kryptofranc/kryptofranccore/src/rpc/net.cpp
	sudo cp $MOD assets_installer/kryptofranc_replace/rawtransaction.cpp ~/kryptofranc/kryptofranccore/src/rpc/
	sudo cp $MOD assets_installer/kryptofranc_replace/server.cpp ~/kryptofranc/kryptofranccore/src/rpc/

	sudo cp $MOD assets_installer/kryptofranc_replace/amount.h ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/bitcoin-cli.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/bitcoind.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/chainparams.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/chainparamsbase.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/init.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/key.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/net.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/pow.cpp ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/util.h ~/kryptofranc/kryptofranccore/src/
	sudo cp $MOD assets_installer/kryptofranc_replace/validation.cpp ~/kryptofranc/kryptofranccore/src/

	sudo rm -rf ~/kryptofranc/kryptofranccore/src/qt/locale
	sudo cp $MOD -R assets_installer/locale ~/kryptofranc/kryptofranccore/src/qt/
	sudo cp $MOD assets_installer/bitcoin.png ~/kryptofranc/kryptofranccore/src/qt/res/icons/bitcoin.png
	sudo cp $MOD assets_installer/bitcoin.ico ~/kryptofranc/kryptofranccore/src/qt/res/icons/bitcoin.ico
fi
if [ $INSTALL = "yes" ]; then
    echo -e "$BYellow --------------------------------------------------"
    echo -e "$BGreen Install and configure DB4..."
    echo -e $Color_Off
    
    sudo mkdir ~/kryptofranc/kryptofranccore/db4/
    cd ~/kryptofranc/kryptofranccore/db4
    @sudo wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz
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

    cd ~/kryptofranc/kryptofranccore/depends
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
    
    cd ~/kryptofranc/kryptofranccore
    sudo ./autogen.sh
    sudo ./configure LDFLAGS="-L$DB4_PATH/lib/" CPPFLAGS="-I$DB4_PATH/include/" 
    sudo sed -i -e 's/bitcoincore.org/kryptofranc.com/g' ~/kryptofranc/kryptofranccore/src/config/bitcoin-config.h    
    sudo sed -i -e 's/bitcoin/kryptofranc/g' ~/kryptofranc/kryptofranccore/src/config/bitcoin-config.h
    sudo sed -i -e 's/Bitcoin/Kryptofranc/g' ~/kryptofranc/kryptofranccore/src/config/bitcoin-config.h
    sudo sed -i -e 's/BITCOIN/KRYPTOFRANC/g' ~/kryptofranc/kryptofranccore/src/config/bitcoin-config.h    
fi

sudo chmod -R 777 ~/kryptofranc

echo -e "$BYellow --------------------------------------------------"
echo -e "$BGreen MAKING! "
echo -e $Color_Off
cd ~/kryptofranc/kryptofranccore
sudo make
sudo make
sudo @mkdir ~/kryptofranc/kryptofranccore/binaries
sudo mv ~/kryptofranc/kryptofranccore/src/bitcoind ~/kryptofranc/kryptofranccore/binaries/kryptofrancd
sudo mv	~/kryptofranc/kryptofranccore/src/bitcoin-tx ~/kryptofranc/kryptofranccore/binaries/kryptofranc-tx
sudo mv	~/kryptofranc/kryptofranccore/src/bitcoin-cli ~/kryptofranc/kryptofranccore/binaries/kryptofranc-cli
sudo mv	~/kryptofranc/kryptofranccore/src/qt/bitcoin-qt ~/kryptofranc/kryptofranccore/binaries/kryptofranc-qt

if [ $NOEXEC = "no" ]; then
    ~/kryptofranc/kryptofranccore/binaries/kryptofranc-qt
fi
exit;
