#
# Copyright (C) 2012-2012 Componentality Oy
#
include $(TOPDIR)/rules.mk

PKG_NAME:=saha-config-sierra
PKG_VERSION:=1
PKG_RELEASE:=0

include $(INCLUDE_DIR)/package.mk

define Package/saha-config-sierra
  SECTION:=utils
  CATEGORY:=SAHA FlexRoad Configuration
  URL:=http://www.componentality.com/
  TITLE:=SAHA Sierra 3G modem configuration routine
  DEPENDS:= +saha-common +kmod-usb-serial-sierrawireless +comgt \
			+chat +pppdump +pppstats
  PKGARCH:=all
  MAINTAINER:=Componentality Oy
endef

define Package/saha-config-sierra/description
   SAHA Sierra 3G modem configuration routine
endef

define Build/Compile
	true
endef

#also install notify, gpstest, distance daemon

define Package/saha-config-sierra/install
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/saha-sierra.init $(1)/etc/init.d/saha-sierra.init
endef

$(eval $(call BuildPackage,saha-config-sierra))
