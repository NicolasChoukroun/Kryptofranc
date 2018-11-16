KryptoFranc 0.12.1
=====================

Setup
---------------------
[KryptoFranc](http://kryptofranc.org/en/download) is the original kryptoFranc client and it builds the backbone of the network. However, it downloads and stores the entire history of kryptoFranc transactions (which is currently several GBs); depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

Running
---------------------
The following are some helpful notes on how to run kryptoFranc on your native platform.

### Unix

You need the Qt4 run-time libraries to run kryptoFranc-Qt. On Debian or Ubuntu:

	sudo apt-get install libqtgui4

Unpack the files into a directory and run:

- bin/32/kryptofranc-qt (GUI, 32-bit) or bin/32/kryptofrancd (headless, 32-bit)
- bin/64/kryptofranc-qt (GUI, 64-bit) or bin/64/kryptofrancd (headless, 64-bit)



### Windows

Unpack the files into a directory, and then run kryptofranc-qt.exe.

### OS X

Drag kryptoFranc-Core to your applications folder, and then run kryptoFranc-Core.

### Need Help?

* See the documentation at the [kryptoFranc Wiki](https://en.kryptofranc.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#kryptofranc](http://webchat.freenode.net?channels=kryptofranc) on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net?channels=kryptofranc).
* Ask for help on the [kryptoFrancTalk](https://kryptofranctalk.org/) forums, in the [Technical Support board](https://kryptofranctalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build Bitcoin on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [OS X Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [Gitian Building Guide](gitian-building.md)

Development
---------------------
The kryptoFranc repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Multiwallet Qt Development](multiwallet-qt.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/kryptofranc/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Unit Tests](unit-tests.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)

### Resources
* Discuss on the [kryptoFrancTalk](https://kryptofranctalk.org/) forums, in the [Development & Technical Discussion board](https://kryptofranctalk.org/index.php?board=6.0).
* Discuss project-specific development on #kryptofranc-core-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=kryptofranc-core-dev).
* Discuss general kryptoFranc development on #kryptofranc-dev on Freenode. If you don't have an IRC client use [webchat here](http://webchat.freenode.net/?channels=kryptofranc-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [Files](files.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)

License
---------------------
Distributed under the [MIT software license](http://www.opensource.org/licenses/mit-license.php).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
