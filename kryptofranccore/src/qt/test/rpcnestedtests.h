// Copyright (c) 2016-2018 The KryptoFranc developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_QT_TEST_RPCNESTEDTESTS_H
#define KRYPTOFRANC_QT_TEST_RPCNESTEDTESTS_H

#include <QObject>
#include <QTest>

#include <txdb.h>
#include <txmempool.h>

class RPCNestedTests : public QObject
{
    Q_OBJECT

    private Q_SLOTS:
    void rpcNestedTests();
};

#endif // KRYPTOFRANC_QT_TEST_RPCNESTEDTESTS_H
