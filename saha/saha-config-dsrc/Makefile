#
# Copyright (C) 2012-2012 Componentality Oy
#
include $(TOPDIR)/rules.mk

PKG_NAME:=saha-config-dsrc
PKG_VERSION:=1
PKG_RELEASE:=0

include $(INCLUDE_DIR)/package.mk

define Package/saha-config-dsrc
  SECTION:=utils
  CATEGORY:=SAHA FlexRoad Configuration
  URL:=http://www.componentality.com/
  TITLE:=SAHA Sierra 3G modem configuration routine
  DEPENDS:= +saha +saha-common +kmod-batman-adv \
			+vis +pciutils
  PKGARCH:=all
  MAINTAINER:=Componentality Oy
endef

define Package/saha-config-dsrc/description
   SAHA dsrc configuration unit
endef

define Build/Compile
	true
endef


define Package/saha-config-dsrc/install
	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) ./files/saha-dsrc.init $(1)/etc/init.d/saha-dsrc.init
endef

$(eval $(call BuildPackage,saha-config-dsrc))
