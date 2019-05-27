// Copyright (c) 2009-2019 The Bitcoin Core developers
// Copyright (c) 2018-2019 The Kryptofranc Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_TEST_FUZZ_FUZZ_H
#define KRYPTOFRANC_TEST_FUZZ_FUZZ_H

#include <functional>
#include <stdint.h>
#include <vector>


const std::function<std::string(const char*)> G_TRANSLATION_FUN = nullptr;

void test_one_input(std::vector<uint8_t> buffer);

#endif // KRYPTOFRANC_TEST_FUZZ_FUZZ_H
