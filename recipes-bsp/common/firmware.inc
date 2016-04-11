RPIFW_SRCREV = "e968a4e72e1be3357391804bd07691a60ab0ed43"
RPIFW_DATE = "20160411"

# avoid this repository due to large size and slow load.
# local copy placed in recipes-bsp/bootfiles/files
#RPIFW_SRC_URI ?= "git://github.com/raspberrypi/firmware.git;protocol=git;branch=master"

RPIFW_SRC_URI ?= "https://github.com/raspberrypi/firmware/archive/${RPIFW_SRCREV}.zip"

#RPIFW_S ?= "${WORKDIR}/firmware-master"
RPIFW_S ?= "${WORKDIR}/firmware-${RPIFW_SRCREV}"

SRC_URI = "${RPIFW_SRC_URI}"
SRCREV = "${RPIFW_SRCREV}"
PV = "${RPIFW_DATE}"

SRC_URI[md5sum] = "8341e67977a6539d98ce92157b79d313"
SRC_URI[sha256sum] = "3860133cdb90fba7b982ed6400643e077b2b2cf9f1d0847de2e75a4010d418b8"


PR = "r11"
