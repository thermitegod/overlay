# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs git-r3 qmake-utils
DESCRIPTION="Simple application to read current clocks of ATi Radeon cards"
HOMEPAGE="https://github.com/marazmista/radeon-profile"
EGIT_REPO_URI="https://github.com/marazmista/radeon-profile.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
	x11-libs/libdrm
	x11-libs/libXrandr
    dev-qt/qtcharts
	x11-apps/mesa-progs
    x11-apps/xdriinfo
	x11-apps/xrandr
"
src_configure() {
	pushd radeon-profile
	eqmake5
	emake
}
src_install() {
	pushd radeon-profile
	dobin radeon-profile
}
