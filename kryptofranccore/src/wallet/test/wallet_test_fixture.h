// Copyright (c) 2016-2018 xxxxxx
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_WALLET_TEST_WALLET_TEST_FIXTURE_H
#define KRYPTOFRANC_WALLET_TEST_WALLET_TEST_FIXTURE_H

#include <test/test_bitcoin.h>

#include <wallet/wallet.h>

#include <memory>

/** Testing setup and teardown for wallet.
 */
struct WalletTestingSetup: public TestingSetup {
    explicit WalletTestingSetup(const std::string& chainName = CBaseChainParams::MAIN);
    ~WalletTestingSetup();

    CWallet m_wallet;
};

#endif // KRYPTOFRANC_WALLET_TEST_WALLET_TEST_FIXTURE_H
