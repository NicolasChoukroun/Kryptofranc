// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H
#define KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class KryptofrancAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KryptofrancAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Kryptofranc address widget validator, checks for a valid kryptofranc address.
 */
class KryptofrancAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit KryptofrancAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H
