#/bin/sh -e

VERSION=$2
TAR=../dlib_$VERSION.orig-models.tar.gz
NEWTAR=../dlib_$VERSION.orig-dlib-models.tar.bz2
DIR=dlib-models
mkdir -p $DIR

# Unpack ready fo re-packing
tar -xzf $TAR -C $DIR --strip-components=1

# Uncompress the models
bzip2 -d $DIR/*.bz2

# Repack
rm $TAR
GZIP=--best tar -cjf $NEWTAR $DIR

rm -rf $DIR

