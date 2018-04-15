#!/bin/bash
case "$SHED_DEVICE" in
    orangepi-pc2)
        SHDPKG_ATF_PLATFORM='sun50iw1p1'
        SHDPKG_ATF_TARGET='bl31'
        SHDPKG_ATF_PRODUCT='build/sun50iw1p1/debug/bl31.bin'
        ;;
    *)
        echo "Unsupported device: $SHED_DEVICE"
        exit 1
        ;;
esac
make PLAT="$SHDPKG_ATF_PLATFORM" DEBUG=1 "$SHDPKG_ATF_TARGET" &&
install -dm755 "${SHED_FAKE_ROOT}/boot/u-boot" &&
install -m644 "$SHDPKG_ATF_PRODUCT" "${SHED_FAKE_ROOT}/boot/u-boot"
