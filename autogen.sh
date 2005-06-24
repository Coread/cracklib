#!/bin/sh -x

# This script runs commands necessary to generate a Makefile for libgif.

#echo "Warning: This script will run configure for you -- if you need to pass"
#echo "  arguments to configure, please give them as arguments to this script."

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

THEDIR="`pwd`"
cd $srcdir

aclocal -I m4
autoheader
libtoolize --automake --copy
automake --add-missing --copy
autoconf
automake

cd $THEDIR

# I hate that... 
#$srcdir/configure $*

exit 0

