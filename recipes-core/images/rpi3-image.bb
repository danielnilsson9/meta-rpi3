SUMMARY = "A special developed embedded image for Sauer Danfoss."
LICENSE = "Apache 2.0"

include recipes-core/images/core-image-minimal.bb

IMAGE_INSTALL += " \
	kernel-module-brcmfmac \
	kernel-module-rpi-ft5406 \
        kernel-module-evdev \
	kernel-module-rpi-backlight \
	linux-firmware-brcm43430 bluez5 \
"

export IMAGE_BASENAME = "rpi3-image"
