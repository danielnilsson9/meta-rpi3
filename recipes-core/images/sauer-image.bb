SUMMARY = "A special developed embedded image for Sauer Danfoss."
LICENSE = "Apache 2.0"

include recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL += " kernel-module-brcmfmac"

#IMAGE_FEATURES += ""

LICENSE_FLAGS_WHITELIST = "commercial"
DISTRO_FEATURES_append = " bluetooth wifi"

SERIAL_CONSOLE = ""


CORE_OS = " \
    openssh openssh-keygen openssh-sftp-server \
"

WIFI = " \
    linux-firmware-brcm43430 \
    wireless-tools \
    wpa-supplicant \
"

BLUETOOTH = " \  
    bluez5 \
"

TOOLS = " \
    nano \
"

RPI_STUFF = " \
    \
"

IMAGE_INSTALL += " \
    ${CORE_OS} \
    ${BLUETOOTH} \
    ${WIFI} \
    ${TOOLS} \
    ${RPI_STUFF} \
"


inherit extrausers
EXTRA_USERS_PARAMS = "usermod -P 1234 root;"

export IMAGE_BASENAME = "rpi3-image"
