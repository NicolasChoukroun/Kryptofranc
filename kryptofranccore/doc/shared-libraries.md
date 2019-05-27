Shared Libraries
================

## kryptofrancconsensus

The purpose of this library is to make the verification functionality that is critical to Kryptofranc's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `kryptofrancconsensus.h` located in `src/script/kryptofrancconsensus.h`.

#### Version

`kryptofrancconsensus_version` returns an `unsigned int` with the API version *(currently `1`)*.

#### Script Validation

`kryptofrancconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `kryptofrancconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/kryptofranc/bips/blob/master/bip-0016.mediawiki)) subscripts
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/kryptofranc/bips/blob/master/bip-0066.mediawiki)) compliance
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/kryptofranc/bips/blob/master/bip-0147.mediawiki))
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/kryptofranc/bips/blob/master/bip-0065.mediawiki))
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/kryptofranc/bips/blob/master/bip-0112.mediawiki))
- `kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/kryptofranc/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `kryptofrancconsensus_ERR_OK` - No errors with input parameters *(see the return value of `kryptofrancconsensus_verify_script` for the verification status)*
- `kryptofrancconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `kryptofrancconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `kryptofrancconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `kryptofrancconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NKryptofranc](https://github.com/NicolasDorier/NKryptofranc/blob/master/NKryptofranc/Script.cs#L814) (.NET Bindings)
- [node-libkryptofrancconsensus](https://github.com/bitpay/node-libkryptofrancconsensus) (Node.js Bindings)
- [java-libkryptofrancconsensus](https://github.com/dexX7/java-libkryptofrancconsensus) (Java Bindings)
- [kryptofrancconsensus-php](https://github.com/Bit-Wasp/kryptofrancconsensus-php) (PHP Bindings)
