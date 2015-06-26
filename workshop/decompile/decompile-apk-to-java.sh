#!/bin/bash

# First you need some stuff ready
##################################
## http://code.google.com/p/dex2jar/
## http://jd.benow.ca/
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
    echo "         ./decompile-apk-to-java.sh ~/temp/my-apk-release.apk"
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
read -p "Will Dex2jar ./$filename-zip/classes.dex"
d2j-dex2jar.sh ./$filename-zip/classes.dex

echo
read -p "GO TO jd-gui, open ./classes-dex2jar.jar and SAVE ALL SOURCES as ZIP file to ./classes-dex2jar.src.zip"
jd-gui

echo
read -p "Will unzip ./classes-dex2jar.src.zip into source output directory to get source code"
mkdir ./$filename-source/src/
unzip ./classes-dex2jar.src.zip -d ./$filename-source/src/

echo
echo
echo "Decompiling done"

echo
read -p "Will delete temp data"
rm ./$filename.zip
rm -rf ./$filename-zip
rm ./classes-dex2jar.jar
rm ./classes-dex2jar.src.zip