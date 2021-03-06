SRCREV = "648ffc470824c43eb0d16c485f4c24816b32cd6f"

do_deploy_append() {

    echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "## enable_uart" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "##     New firmware parameter" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "##     RPi3 won't boot without this or disabling of BT" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "enable_uart=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    if [ -n "${ENABLE_RPI3_SERIAL_CONSOLE}" ]; then
        echo "" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	echo "## Disable RPi3 bluetooth to enable serial console on UART0" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
        echo "dtoverlay=pi3-disable-bt-overlay.dtb" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    fi

    # disable act led
    echo "dtparam=act_led_trigger=none" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
	
    # move bt to mini uart
    #echo "dtoverlay=pi3-miniuart-bt" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    # stable mini uart baudrate
    echo "core_freq=250" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    
    # remove colored spash screen
    echo "disable_splash=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    # rotate for touch screen
    echo "lcd_rotate=2" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

    # disable flasing under voltage warning
    echo "avoid_warnings=1" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt

}
