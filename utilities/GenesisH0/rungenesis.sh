#04ffff001d01043a4269744672616e6320312f312f323031393a204c612072656e61697373616e6365206465206c61206d6f6e6e616965206672616ec3a761697365
#algorithm: SHA256
#merkle hash: 247747ba019d7b9dbc5729d3760437cb68c1de83639e111b4d62e12632cf12e9
#pszTimestamp: BitFranc 1/1/2019: La renaissance de la monnaie française
#pubkey: #04678afdb0fe5548271967f1a67130b7105cd6a828e03909a67962e0ea1f61deb649f6bc3f4cef38c4f35504e51ec112de5c384df7ba0b8d578a4c702b6bf11d5f
#time: 1546300800
#bits: 0x207fffff
#Searching for genesis hash..
#genesis hash found!
#nonce: 3
#genesis hash: 7866e6893c5572b08ecdfd0a0c4910d896f2248356cbee2d33dcc995b84ecb46



sudo apt update
sudo apt install python-pip
sudo pip install scrypt construct==2.5.2
sudo -- python genesis.py -z "BitFranc 1/1/2019: La renaissance de la monnaie française" -t 1546300800 -b 0x207fffff

