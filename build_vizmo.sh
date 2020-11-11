#!/bin/bash
#
# Clone prepare script
#

TOPDIR=`pwd`
VIZMO_URL="https://joby-thampan:vizmo1234@github.com/joby-thampan/vizmo.git"
VIZMO_BRANCH="linux"

check_git()
{
	which git > /dev/null || _die "Missing 'git' tool. Please install 'git' in your PC to continue."
	git config --get user.name > /dev/null || _die "Specify your user name with: git config --global user.name \"Firstname Lastname\""
	git config --get user.email > /dev/null || _die "specify your user email with: git config --global user.email \"firstname.lastname@domain.com\""
}

setup_vizmo_build()
{
	check_git
	git clone --depth 100 --single-branch --branch "$VIZMO_BRANCH" "$VIZMO_URL"
   	cd ${TOPDIR}/vizmo/
	./vizmo_openwrt_install.sh
   	cd ${TOPDIR}/vizmo/
	cp -rf configs/.config_openwrt openwrt/.config
	cp -rf configs/.config_linux linux-4.14.172/.config
   	cd ${TOPDIR}/vizmo/openwrt/
	make -j8
}

setup_vizmo_build

