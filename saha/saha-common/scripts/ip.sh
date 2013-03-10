#!/bin/bash

PACKAGE_ROOT="../../attitude_adjustment"
FILE_D="${PACKAGE_ROOT}/package/base-files/files/lib/functions/uci-defaults.sh"
FILE_N="${PACKAGE_ROOT}/target/linux/ar71xx/base-files/etc/uci-defaults/network"

lan_static_ip() {
	local ip=$1
	local mask=$2
	local gw=$3
	local dns=$4

	local RP="\
	local\ ifname=\$1\n\
\n\
	uci\ batch\ <<EOF\n\
set\ network.lan='interface'\n\
set\ network.lan.ifname='\$ifname'\n\
set\ network.lan.type='bridge'\n\
set\ network.lan.proto='static'\n\
set\ network.lan.ipaddr='$ip'\n\
set\ network.lan.netmask='$mask'\n\
set\ network.lan.gateway='$gw'\n\
set\ network.lan.dns='$dns'\n\
EOF\n"
	sed -i "/ucidef_set_interface_lan()/{:r;/}/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_D

	RP="	ucidef_set_interfaces_lan \"eth0\""
	sed -i "/rb-411u/{:r;/\;\;/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_N
}

lan_dhcp() {
	local RP="\
	local\ ifname=\$1\n\
\n\
	uci\ batch\ <<EOF\n\
set\ network.lan='interface'\n\
set\ network.lan.ifname='\$ifname'\n\
set\ network.lan.type='bridge'\n\
set\ network.lan.proto='dhcp'\n\
EOF\n"
	sed -i "/ucidef_set_interface_lan()/{:r;/}/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_D

	RP="	ucidef_set_interfaces_lan \"eth0\""
	sed -i "/rb-411u/{:r;/\;\;/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_N
}

wan_sierra() {
	local apn=$1
	local user=$2
	local pass=$3

	local RP="\
	local\ ifname=\$1\n\
\n\
	uci\ batch\ <<EOF\n\
set\ network.wan='interface'\n\
set\ network.wan.ifname='\$ifname'\n\
set\ network.wan.proto='3g'\n\
set\ network.wan.apn='$apn'\n\
set\ network.wan.username='$user'\n\
set\ network.wan.password='$pass'\n\
set\ network.wan.service='umts'\n\
set\ network.wan.device='\/dev\/tty_detect_USB'\n\
EOF\n"
	sed -i "/ucidef_set_interface_wan()/{:r;/}/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_D

	RP="	ucidef_set_interfaces_lan_wan \"eth0\" \"ppp0\""
	sed -i "/rb-411u/{:r;/\;\;/!{N;br}; s/\n.*\n/\n$RP\n/;}" $FILE_N

}
