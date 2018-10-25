#!/bin/bash
declare -A SHED_PKG_LOCAL_OPTIONS=${SHED_PKG_OPTIONS_ASSOC}
for SHED_PKG_LOCAL_OPTION in "${!SHED_PKG_LOCAL_OPTIONS[@]}"; do
    # Configure
    case "$SHED_PKG_LOCAL_OPTION" in
        sun50iw1p1)
            SHED_PKG_ATF_PLATFORM='sun50iw1p1'
            SHED_PKG_ATF_TARGET='bl31'
            SHED_PKG_ATF_PRODUCT='build/sun50iw1p1/debug/bl31.bin'
            ;;
    esac
done
# Build and Install
make PLAT="$SHED_PKG_ATF_PLATFORM" DEBUG=1 "$SHED_PKG_ATF_TARGET" &&
install -dm755 "${SHED_FAKE_ROOT}/boot/u-boot" &&
install -m644 "$SHED_PKG_ATF_PRODUCT" "${SHED_FAKE_ROOT}/boot/u-boot"
