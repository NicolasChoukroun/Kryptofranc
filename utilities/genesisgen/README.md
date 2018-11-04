# genesisgen

Genesis block generator
=======================

This program is based on "Remember remember the 5th of November"'s post [[ANN] Genesis Block Generator](https://bitcointalk.org/index.php?topic=181981.0) with some improvements.

+ Add a Makefile
+ Add command line arguments for startNonce and unixtime
+ If timestamp string is longer than 76 bytes, add `OP_PUSHDATA1(0x4c)` to scriptSig.

Compilation
=====
```
gcc genesis.c -o genesis -lcrypto
```

Generate public and private keys
=====
```
openssl ecparam -genkey -name secp256k1 -text -noout -outform DER | xxd -p -c 1000 | sed 's/41534e31204f49443a20736563703235366b310a30740201010420/PrivKey: /' | sed 's/a00706052b8104000aa144034200/\'$'\nPubKey: /'

```

``
PubKey for Kryptofranc:

049da5cd045a7b22b11d2b4629354b040f6cc5838443c0447bcfe1d3f74025377ce3842fdb92cd1fb2041e78432b9a0a0148604303d00ccd0dfe1514d45b00d3ed
``

Private key has been destroyed... for obvious reason.


Usage
=====

```base
    $ make
    $ ./genesis
    Usage: ./genesis [options] <pubkey> "<timestamp>" <nBits> <startNonce> <unixtime>
    $ ./genesis 04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f "The Times 03/Jan/2009 Chancellor on brink of second bailout for banks" 486604799 2083236893 1231006505
    nBits: 0x1d00ffff
    startNonce: 2083236893
    unixtime: 1231006505

    Coinbase: 04ffff001d0104455468652054696d65732030332f4a616e2f32303039204368616e63656c6c6f72206f6e206272696e6b206f66207365636f6e64206261696c6f757420666f722062616e6b73

    PubkeyScript: 4104678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5fac

    Merkle Hash: 3ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a
    Byteswapped: 4a5e1e4baab89f3a32518a88c31bc87f618f76673e2cc77ab2127b7afdeda33b
    Generating block...

    Block found!
    Hash: 000000000019d6689c085ae165831e934ff763ae46a2a6c172b3f1b60a8ce26f
    Nonce: 2083236893
    Unix time: 1231006505
```

Kryptofranc specific genesis creation
=====

./genesis 049da5cd045a7b22b11d2b4629354b040f6cc5838443c0447bcfe1d3f74025377ce3842fdb92cd1fb2041e78432b9a0a0148604303d00ccd0dfe1514d45b00d3ed "CNBC 2018/07/24 Singapore Officially Backs a CryptoCurrency and Establishes it as their Official Coin" 486604799 


Reference
=====
https://stackoverflow.com/questions/48101258/how-to-convert-an-ecdsa-key-to-pem-format/49213805#49213805
