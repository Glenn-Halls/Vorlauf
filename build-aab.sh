#!/bin/bash

# This shell script is used to build the Android App Bundle required for upload to Google Play.
# Please note that Android Studio cannot be used to build the AAB required, as it will be rejected
# upon upload to the Play Console. Instead, the AAB must be built from the command line, which this
# script is designed to automate. This script assumes:
#
# 1) Java JDK is installed and accessible globally from the command line (included in $PATH)
# 2) Zip program is installed and accessible globally from the command line (included in $PATH)
# 3) The variables below for your Android Jar / bundletool /  keystore / aapt variables are
#    up to date.

# Path to your Android Jar file - this should match the android SDK and android version
ANDROID_JAR="C:\Users\USERNAME\AppData\Local\Android\Sdk\platforms\android-34\android.jar"
# Path to your keystore
KEYSTORE="KEYSTORE"
# Keystore Password
KEYSTORE_PASSWORD="PW"
# Keystore Alias
KEYSTORE_ALIAS="ALIAS"
# Bundletool file name (in assets/tools)
BUNDLETOOL_FILE="bundletool-all-1.15.6.jar"
# AAPT2 file name (in assets/tools)
AAPT2_FILE="aapt2-8.4.0-alpha07-11315950-windows.jar"


# Make build directory structure
mkdir build
mkdir build/bundletool
mkdir build/output
mkdir build/compiled_resources
mkdir build/aapt2

# Copy bundletool to build directory
cp "assets/tools/$BUNDLETOOL_FILE" "build/bundletool"

# Copy AAPT2 to build directory and extract
cp "assets/tools/$AAPT2_FILE" "build/aapt2"
(cd build/aapt2 && jar -xf $AAPT2_FILE)

# Copy build folder to app root directory for bundle processing
cp -r build app
cd app &&

# Create compiled resources
build/aapt2/aapt2 compile --dir src/main/res -o build/compiled_resources/

# Link compiled resources with Andriod Manifest in protobuf format, output is base APK
build/aapt2/aapt2 link --proto-format -o build/output/base.apk \
-I $ANDROID_JAR \
--manifest src/main/AndroidManifest.xml \
-R build/compiled_resources/*.flat \
--auto-add-overlay

# Unzip APK
unzip -q build/output/base.apk -d build/output/base-apk

# Reformat APK file structure into Android App Bundle Format, saved in build/output/aab
mkdir build/output/aab
mkdir build/output/aab/manifest
cp build/output/base-apk/AndroidManifest.xml build/output/aab/manifest/
cp -r build/output/base-apk/res build/output/aab
cp build/output/base-apk/resources.pb build/output/aab

# Zip (using 7-zip commands) AAB structure into "aab-base.zip" in the build/output directory
cd build/output/aab &&
zip a ../aab-base.zip

# Build AAB using bundletool
cd ../..
java -jar bundletool/$BUNDLETOOL_FILE \
build-bundle \
--modules=output/aab-base.zip \
--output=output/unsigned-bundle.aab

# Sign the AAB
jarsigner -verbose \
-keystore "$KEYSTORE" -storepass "$KEYSTORE_PASSWORD" \
-signedjar output/signed-bundle.aab output/unsigned-bundle.aab $KEYSTORE_ALIAS

# Move AAB to release directory and cleanup build directories
cd ../..
mkdir release
mv app/build/output/signed-bundle.aab release/vorlauf.aab
rm -r build
rm -r app/build
