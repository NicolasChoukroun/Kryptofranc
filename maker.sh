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
echo -e "$BCyan kryptofranc Maker: version 1.0"
echo -e "$BBlue maker unix/win64/win32/mac"
echo -e "$BGreen  win       compile for Windows os "
echo -e "  unix      compile for Unix (default)"
echo -e "  win64      compile for windows 64 bits"
echo -e "  win32      compile for windows 32 bits"
echo -e "  mac      compile for MAC"
echo
echo -e "$BYellow example: ./maker.sh unix"
echo "  ->will compile for unix"
echo "--------------------------------------------------------------"
echo -e $Color_Off

sudo chmod -R 777 kryptofranc

# initialize the internal variables
OS="unix"

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

ALL="no"

# loop through all the options and set the corresponding variables
while [ "$1" != "" ]; do
	case $1 in
	    all)
			ALL="yes"
		::
		unix)
			OS="unix"
	      ;;
	    win64)
	    	OS="win64"
	     ;;
	    win32)
	    	OS="win32"
	     ;;
	    help)
	    	exit
	    ;;
	esac
	shift
done

$MOD="-u"

echo -e "$BYellow --------------------------------------------------"
echo " *** EXECUTING SCRIPT WITH OPTIONS ***"
echo "OS option $OS"
echo "--------------------------------------------------"
echo -e $Color_Off


if [ $OS = "unix" ]; then

	if [ $ALL = "yes" ]; then
		sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
		sudo apt-get install libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev 
		
		sudo apt-get install software-properties-common
		sudo add-apt-repository ppa:bitcoin/bitcoin
		sudo apt-get update
		sudo apt-get install libdb4.8-dev libdb4.8++-dev
		
		sudo apt-get install libminiupnpc-dev
		sudo apt-get install libzmq3-dev
	fi
	sudo ./kryptofranccore/autogen.sh
	sudo ./kryptofranccore/configuration --disable-tests --disable-bench
	sudo make
	mv ./kryptofranccore/src/bitcoind ./kryptofranccore/src/kyfd
	mv ./kryptofranccore/src/bitcointx ./kryptofranccore/src/kyf-tx
	mv ./kryptofranccore/src/bitcoin-cli ./kryptofranccore/src/kyf-cli
	mv ./kryptofranccore/src/qt/bitcoin-qt ./kryptofranccore/src/qt/kyf-qt
fi


echo -e "$BYellow --------------------------------------------------"
echo -e "$BGreen MAKING! "
echo -e $Color_Off
sudo @mkdir binaries
sudo @mv kryptofranccore/src/bitcoind /binaries/kyfd
sudo @mv kryptofranccore/src/bitcoin-tx /binaries/kyf-tx
sudo @mv kryptofranccore/src/bitcoin-cli /binaries/kyf-cli
sudo @mv kryptofranccore/src/qt/bitcoin-qt /binaries/kyf-qt

exit;
