FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION ?= "4.4.6"

SRCREV = "5fe9c7b56989bed7360dc560f18cac7f36c9a7d4"
SRC_URI = "git://github.com/raspberrypi/linux.git;protocol=git;branch=rpi-4.4.y \
           file://0001-dts-add-overlay-for-pitft22.patch \
"

require linux-raspberrypi.inc
