#
# Copyright (C) 2012-2012 Componentality Oy
#
include $(TOPDIR)/rules.mk

PKG_NAME:=saha-common
PKG_VERSION:=0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/saha-common
  SECTION:=utils
  CATEGORY:=SAHA FlexRoad Configuration
  URL:=http://www.componentality.com/
  TITLE:=SAHA common configuration files and utilities
  MENU:=1
  PKGARCH:=all
  MAINTAINER:=Componentality Oy
endef

define Package/saha-common/description
   FlexRoad common configuration files and utilities
endef

define Package/saha-common/config
	source "$(SOURCE)/Config.in"
endef

define Build/Compile
	true
endef


define ApplyIPConfig
	$(if $(CONFIG_SAHA_FR_GW_LAN_STATIC),\
		@. $(SOURCE)/scripts/ip.sh; lan_static_ip "$(CONFIG_SAHA_FR_GW_LAN_IP)"\
			"$(CONFIG_SAHA_FR_GW_LAN_MASK)"\
			"$(CONFIG_SAHA_FR_GW_LAN_DEFAULT_GW)"\
			"$(CONFIG_SAHA_FR_GW_LAN_DNS)",\
		@. $(SOURCE)/scripts/ip.sh; lan_dhcp)
endef

define ApplySierraConfig
	$(if $(CONFIG_SAHA_FR_GW_SIERRA),\
		@. $(SOURCE)/scripts/ip.sh; wan_sierra "$(CONFIG_SAHA_FR_GW_SIERRA_APN)"\
		"$(CONFIG_SAHA_FR_GW_SIERRA_USER)"\
		"$(CONFIG_SAHA_FR_GW_SIERRA_PWD)")
endef

define Package/saha-common/install
	SRC=$(SOURCE)/files/saha

	$(INSTALL_DIR) $(1)/etc/config/
	$(CP) $(SOURCE)/files/saha.src $(SOURCE)/files/saha

	$(call ApplyIPConfig)
	$(if $(CONFIG_SAHA_FR_GW_SIERRA),$(call ApplySierraConfig))

	$(if $(CONFIG_SAHA_FR_DSRC_SSID),\
		@sed "s@essid .*@essid '$(CONFIG_SAHA_FR_DSRC_SSID)'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_CHANNEL),\
		@sed "s@channel .*@channel '$(CONFIG_SAHA_FR_DSRC_CHANNEL)'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_BSSID),\
		@sed "s@bssid .*@bssid '$(CONFIG_SAHA_FR_DSRC_BSSID)'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_PROTO),\
		@sed "s@hwmode .*@hwmode '$(CONFIG_SAHA_FR_DSRC_PROTO)'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_GW_BLA),\
		@sed "s@bla .*@bla 'true'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha, \
		@sed "s@bla .*@bla 'false'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_VIS_SERVER),\
		@sed "s@vis_server .*@vis_server 'true'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha, \
		@sed "s@vis_server .*@vis_server 'false'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_VIS_CLIENT),\
		@sed "s@vis_client .*@vis_client 'true'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha, \
		@sed "s@vis_client .*@vis_client 'false'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_COUNTRY_NL),\
		@sed "s@country .*@country 'NL'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_COUNTRY_RU),\
		@sed "s@country .*@country 'RU'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_SAHA_FR_DSRC_COUNTRY_FI),\
		@sed "s@country .*@country 'FI'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)
	$(if $(CONFIG_FLEXROAD_DSRC_GW),\
		@sed "s@dsrc_gw .*@dsrc_gw 'true'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha, \
		@sed "s@dsrc_gw .*@dsrc_gw 'false'@" $(SOURCE)/files/saha > $(SOURCE)/files/saha.sv;\
		mv $(SOURCE)/files/saha.sv $(SOURCE)/files/saha)

	$(INSTALL_DATA) ./files/saha $(1)/etc/config/saha
	$(INSTALL_DIR) $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,saha-common))

