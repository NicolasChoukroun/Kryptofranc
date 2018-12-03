#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

KRYPTOFRANCD=${KRYPTOFRANCD:-$BINDIR/kryptofrancd}
KRYPTOFRANCCLI=${KRYPTOFRANCCLI:-$BINDIR/kryptofranc-cli}
KRYPTOFRANCTX=${KRYPTOFRANCTX:-$BINDIR/kryptofranc-tx}
KRYPTOFRANCQT=${KRYPTOFRANCQT:-$BINDIR/qt/kryptofranc-qt}

[ ! -x $KRYPTOFRANCD ] && echo "$KRYPTOFRANCD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
KYFVER=($($KRYPTOFRANCCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for kryptofrancd if --version-string is not set,
# but has different outcomes for kryptofranc-qt and kryptofranc-cli.
echo "[COPYRIGHT]" > footer.h2m
$KRYPTOFRANCD --version | sed -n '1!p' >> footer.h2m

for cmd in $KRYPTOFRANCD $KRYPTOFRANCCLI $KRYPTOFRANCTX $KRYPTOFRANCQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${BTCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${KYFVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
