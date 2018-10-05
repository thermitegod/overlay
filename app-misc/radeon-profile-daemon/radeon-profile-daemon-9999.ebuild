# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs git-r3 qmake-utils
DESCRIPTION="System daemon for reading info about Radeon GPU clocks and volts as well as control card power profiles"
HOMEPAGE="https://github.com/marazmista/radeon-profile-daemon"
EGIT_REPO_URI="https://github.com/marazmista/radeon-profile-daemon.git"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
    dev-qt/qtcore
"
src_configure() {
	pushd radeon-profile-daemon
	eqmake5
	emake
}
src_install() {
	pushd radeon-profile-daemon
	dobin radeon-profile-daemon
	newinitd "${FILESDIR}/${PN}.init" ${PN}
}
