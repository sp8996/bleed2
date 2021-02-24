#!/bin/bash -e

get_sources() {
  mkdir lineage
  cd lineage

  repo init -u https://github.com/LineageOS/android.git -b lineage-16.0 --depth 1
  repo sync -c --no-tags --no-clone-bundle -j8 -q
  git clone https://github.com/zuk-devs/proprietary_vendor_zuk.git -b lineage-16.0 vendor/zuk
  cd ..
}

#replace_signing_keys() {
 # cd lineage

  #for key in media platform shared testkey
  #do
   # curl -sSL -o build/target/product/security/${key}.pk8 https://github.com/lineageos-dev/signing-keys/raw/master/${key}.pk8
  #  curl -sSL -o build/target/product/security/${key}.x509.pem https://github.com/lineageos-dev/signing-keys/raw/master/${key}.x509.pem
  #done

  #cd ..
#}

build_firmware() {
  cd lineage

  source build/envsetup.sh
  breakfast z2_plus
  croot
  brunch z2_plus

  cd ..
}

get_sources
#replace_signing_keys
build_firmware
