// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2019 The Bitcoin Core developers
// Copyright (c) 2018-2019 The KryptoFranc Core developers

// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_SCRIPT_KRYPTOFRANCCONSENSUS_H
#define KRYPTOFRANC_SCRIPT_KRYPTOFRANCCONSENSUS_H

#include <stdint.h>

#if defined(BUILD_KRYPTOFRANC_INTERNAL) && defined(HAVE_CONFIG_H)
#include <config/bitcoin-config.h>
  #if defined(_WIN32)
    #if defined(DLL_EXPORT)
      #if defined(HAVE_FUNC_ATTRIBUTE_DLLEXPORT)
        #define EXPORT_SYMBOL __declspec(dllexport)
      #else
        #define EXPORT_SYMBOL
      #endif
    #endif
  #elif defined(HAVE_FUNC_ATTRIBUTE_VISIBILITY)
    #define EXPORT_SYMBOL __attribute__ ((visibility ("default")))
  #endif
#elif defined(MSC_VER) && !defined(STATIC_LIBKRYPTOFRANCCONSENSUS)
  #define EXPORT_SYMBOL __declspec(dllimport)
#endif

#ifndef EXPORT_SYMBOL
  #define EXPORT_SYMBOL
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define KRYPTOFRANCCONSENSUS_API_VER 1

typedef enum kryptofrancconsensus_error_t
{
    kryptofrancconsensus_ERR_OK = 0,
    kryptofrancconsensus_ERR_TX_INDEX,
    kryptofrancconsensus_ERR_TX_SIZE_MISMATCH,
    kryptofrancconsensus_ERR_TX_DESERIALIZE,
    kryptofrancconsensus_ERR_AMOUNT_REQUIRED,
    kryptofrancconsensus_ERR_INVALID_FLAGS,
} kryptofrancconsensus_error;

/** Script verification flags */
enum
{
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_NONE                = 0,
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_P2SH                = (1U << 0), // evaluate P2SH (BIP16) subscripts
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_DERSIG              = (1U << 2), // enforce strict DER (BIP66) compliance
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY           = (1U << 4), // enforce NULLDUMMY (BIP147)
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY = (1U << 9), // enable CHECKLOCKTIMEVERIFY (BIP65)
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY = (1U << 10), // enable CHECKSEQUENCEVERIFY (BIP112)
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_WITNESS             = (1U << 11), // enable WITNESS (BIP141)
    kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_ALL                 = kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_P2SH | kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_DERSIG |
                                                               kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY | kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY |
                                                               kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY | kryptofrancconsensus_SCRIPT_FLAGS_VERIFY_WITNESS
};

/// Returns 1 if the input nIn of the serialized transaction pointed to by
/// txTo correctly spends the scriptPubKey pointed to by scriptPubKey under
/// the additional constraints specified by flags.
/// If not nullptr, err will contain an error/success code for the operation
EXPORT_SYMBOL int kryptofrancconsensus_verify_script(const unsigned char *scriptPubKey, unsigned int scriptPubKeyLen,
                                                 const unsigned char *txTo        , unsigned int txToLen,
                                                 unsigned int nIn, unsigned int flags, kryptofrancconsensus_error* err);

EXPORT_SYMBOL int kryptofrancconsensus_verify_script_with_amount(const unsigned char *scriptPubKey, unsigned int scriptPubKeyLen, int64_t amount,
                                    const unsigned char *txTo        , unsigned int txToLen,
                                    unsigned int nIn, unsigned int flags, kryptofrancconsensus_error* err);

EXPORT_SYMBOL unsigned int kryptofrancconsensus_version();

#ifdef __cplusplus
} // extern "C"
#endif

#undef EXPORT_SYMBOL

#endif // KRYPTOFRANC_SCRIPT_KRYPTOFRANCCONSENSUS_H
