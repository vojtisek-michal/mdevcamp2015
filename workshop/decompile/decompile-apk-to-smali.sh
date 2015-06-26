#!/bin/bash

# First you need some stuff ready
##################################
## https://www.androidfilehost.com/?fid=23212708291677144
## https://bitbucket.org/iBotPeaches/apktool/downloads

echo
echo "APK decompiler script v0.1 by Michal Vojtisek (vojtisek.michal@gmail.com)"
echo
echo "   This script is for educational purposes only!"
echo "   You should never decompile others application!"

if ! [ -f "$1" ]
  then
    echo
    echo "   Usage: call this script with APK as an argument"
    echo
    echo "         ./decompile-apk-to-smali.sh ~/temp/my-apk-release.apk"
    echo
    exit
fi

filename=$(basename "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# keep original APK
cp $1 ./$filename.zip

echo
read -p "Will create empty source directory ./$filename-source"
rm -rf ./$filename-source

echo
read -p "Will add ./framework-res.apk for apktool"
apktool if ./framework-res.apk

echo
read -p "Will decompile APK to get resource files and AndroidManifest"
apktool d -d -o ./$filename-source $1

echo
read -p "Will unzip $filename.zip"
unzip $filename.zip -d ./$filename-zip

echo
read -p "Will copy unziped project contents: assets, lib"
cp -r ./$filename-zip/assets/ ./$filename-source/
cp -r ./$filename-zip/lib/ ./$filename-source/

echo
echo
echo "Decompiling done"

echo
read -p "Will delete temp data"
rm ./$filename.zip
rm -rf ./$filename-zip


## a=0;//     .locals 4
## ....
## a=0;//     const v3, true
## a=0;//     #v3=(Boolean);
## a=0;//     return v3

# jarsigner -verify -verbose -certs ./app-release.apk
# keytool -genkey -v -keystore dummy.keystore -alias alias_name -keyalg RSA -keysize 2048 -validity 10000

# apktool b -d app-release-source/
# jarsigner -sigalg SHA1withRSA -digestalg SHA1 -keystore dummy.keystore app-release-source/dist/app-release.apk alias_name
# adb install -r app-release-source/dist/app-release.apk