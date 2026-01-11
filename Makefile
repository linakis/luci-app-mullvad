include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-mullvad
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_MAINTAINER:=Nikos Linakis <nlinakis@gmail.com>

LUCI_TITLE:=Mullvad WireGuard Server Manager
LUCI_DESCRIPTION:=LuCI web interface for managing Mullvad WireGuard VPN servers
LUCI_DEPENDS:=+luci-base +luci-proto-wireguard +wireguard-tools +curl +jsonfilter
LUCI_PKGARCH:=all

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-mullvad/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	chmod +x /usr/bin/mullvad-*.sh 2>/dev/null
	/etc/init.d/rpcd restart
}
exit 0
endef

# call BuildPackage - OpenWrt buildroot signature
