################################################################################
#
# dsptoolkit
#
################################################################################

DSPTOOLKIT_VERSION = 0.12.1
DSPTOOLKIT_SOURCE = hifiberrydsp-$(DSPTOOLKIT_VERSION).tar.gz
DSPTOOLKIT_SITE = https://files.pythonhosted.org/packages/e9/fc/5844905eabfe5640bdb33716f376f70beb131853fcbb2866a2ec2c177527
DSPTOOLKIT_SETUP_TYPE = setuptools
DSPTOOLKIT_LICENSE = MIT
DSPTOOLKIT_LICENSE_FILES = LICENSE.md

define DSPTOOLKIT_INSTALL_INIT_SYSV
	clear
	sleep 10
	$(INSTALL) -D -m 0755 package/dsptoolkit/S90sigmatcp \
		$(TARGET_DIR)/etc/init.d/S90sigmatcp
endef

define DSPTOOLKIT_INSTALL_INIT_SYSTEMD
	clear
	sleep 10
        $(INSTALL) -D -m 0755 package/dsptoolkit/sigmatcp.service \
                $(TARGET_DIR)/lib/systemd/system/sigmatcp.service
endef

$(eval $(python-package))
