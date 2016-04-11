FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

LINUX_VERSION ?= "4.1.20"

SRCREV = "16c5341cefdc2db21838dc198dbe11cac4e19b62"
SRC_URI = "git://github.com/raspberrypi/linux.git;protocol=git;branch=rpi-4.1.y \
           file://0001-dts-add-overlay-for-pitft22.patch \
          "

require linux-raspberrypi.inc
