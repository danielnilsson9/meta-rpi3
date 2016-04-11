FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://BCM43430A1.hcd \
    file://0001-bcm43xx-Add-bcm43xx-3wire-variant.patch \
    file://0002-bcm43xx-The-UART-speed-must-be-reset-after-the-firmw.patch \
    file://0003-Increase-firmware-load-timeout-to-30s.patch \
    file://0004-Move-the-43xx-firmware-into-lib-firmware.patch \
    file://brcm43438.service \
    file://bluetooth.init \
    file://main.conf \
    "

do_install_append() {

    install -d ${D}/lib/firmware/brcm/
    install -m 0644 ${WORKDIR}/BCM43430A1.hcd ${D}/lib/firmware/brcm/BCM43430A1.hcd

    install -d ${D}${sysconfdir}/bluetooth
    install -m 0644 ${WORKDIR}/main.conf ${D}${sysconfdir}/bluetooth

    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -d ${D}${systemd_unitdir}/system
        install -m 0644 ${WORKDIR}/brcm43438.service ${D}${systemd_unitdir}/system
    else
	install -d ${D}${sysconfdir}/init.d
	install -d ${D}${sysconfdir}/rc5.d
	install -m 0755 ${WORKDIR}/bluetooth.init ${D}${sysconfdir}/init.d/bluetooth
	ln -sf ../init.d/bluetooth ${D}${sysconfdir}/rc5.d/S90bluetooth
    fi
}

FILES_${PN}_append = " \
    ${bindir}/hciattach-rpi3 \
    /lib/firmware/brcm/BCM43430A1.hcd \
    "

SYSTEMD_SERVICE_${PN} += "brcm43438.service"
