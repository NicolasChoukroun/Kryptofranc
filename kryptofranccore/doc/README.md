KryptoFranc
=============

Setup
---------------------
KryptoFranc is the original kryptoFranc client and it builds the backbone of the network. It downloads and, by default, stores the entire history of kryptoFranc transactions, which requires a few hundred gigabytes of disk space. Depending on the speed of your computer and network connection, the synchronization process can take anywhere from a few hours to a day or more.

To download KryptoFranc, visit [kryptofranccore.org](https://kryptofranccore.org/en/download/).

Running
---------------------
The following are some helpful notes on how to run KryptoFranc on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/kryptofranc-qt` (GUI) or
- `bin/kryptofrancd` (headless)

### Windows

Unpack the files into a directory, and then run kryptofranc-qt.exe.

### macOS

Drag KryptoFranc to your applications folder, and then run KryptoFranc.

### Need Help?

* See the documentation at the [kryptoFranc Wiki](https://en.kryptofranc.it/wiki/Main_Page)
for help and more information.
* Ask for help on [#kryptofranc](http://webchat.freenode.net?channels=kryptofranc) on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net?channels=kryptofranc).
* Ask for help on the [kryptoFrancTalk](https://kryptofranctalk.org/) forums, in the [Technical Support board](https://kryptofranctalk.org/index.php?board=4.0).

Building
---------------------
The following are developer notes on how to build Bitcoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [Windows Build Notes](build-windows.md)
- [FreeBSD Build Notes](build-freebsd.md)
- [OpenBSD Build Notes](build-openbsd.md)
- [NetBSD Build Notes](build-netbsd.md)
- [Gitian Building Guide (External Link)](https://github.com/kryptofranc-core/docs/blob/master/gitian-building.md)

Development
---------------------
The kryptoFranc repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Developer Notes](developer-notes.md)
- [Productivity Notes](productivity.md)
- [Release Notes](release-notes.md)
- [Release Process](release-process.md)
- [Source Code Documentation (External Link)](https://dev.visucore.com/kryptofranc/doxygen/)
- [Translation Process](translation_process.md)
- [Translation Strings Policy](translation_strings_policy.md)
- [Travis CI](travis-ci.md)
- [JSON-RPC Interface](JSON-RPC-interface.md)
- [Unauthenticated REST Interface](REST-interface.md)
- [Shared Libraries](shared-libraries.md)
- [BIPS](bips.md)
- [Dnsseed Policy](dnsseed-policy.md)
- [Benchmarking](benchmarking.md)

### Resources
* Discuss on the [kryptoFrancTalk](https://kryptofranctalk.org/) forums, in the [Development & Technical Discussion board](https://kryptofranctalk.org/index.php?board=6.0).
* Discuss project-specific development on #kryptofranc-core-dev on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net/?channels=kryptofranc-core-dev).
* Discuss general kryptoFranc development on #kryptofranc-dev on Freenode. If you don't have an IRC client, use [webchat here](http://webchat.freenode.net/?channels=kryptofranc-dev).

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [kryptofranc.conf Configuration File](kryptofranc-conf.md)
- [Files](files.md)
- [Fuzz-testing](fuzzing.md)
- [Reduce Traffic](reduce-traffic.md)
- [Tor Support](tor.md)
- [Init Scripts (systemd/upstart/openrc)](init.md)
- [ZMQ](zmq.md)
- [PSBT support](psbt.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
This product includes software developed by the OpenSSL Project for use in the [OpenSSL Toolkit](https://www.openssl.org/). This product includes
cryptographic software written by Eric Young ([eay@cryptsoft.com](mailto:eay@cryptsoft.com)), and UPnP software written by Thomas Bernard.
