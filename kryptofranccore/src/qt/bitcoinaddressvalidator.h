// Copyright (c) 2011-2014 xxxxxx
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H
#define KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class kryptoFrancAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit kryptoFrancAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** kryptoFranc address widget validator, checks for a valid kryptofranc address.
 */
class kryptoFrancAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit kryptoFrancAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // KRYPTOFRANC_QT_KRYPTOFRANCADDRESSVALIDATOR_H
