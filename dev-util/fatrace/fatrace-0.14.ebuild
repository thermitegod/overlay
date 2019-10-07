# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit linux-info python-r1 toolchain-funcs

DESCRIPTION="report file access events from all running processes"
HOMEPAGE="https://launchpad.net/fatrace"
SRC_URI="https://launchpad.net/${PN}/trunk/${PV}/+download/${P}.tar.xz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="powertop"

RDEPEND="powertop? ( ${PYTHON_DEPS} )"
DEPEND="${RDEPEND}"
REQUIRED_USE="powertop? ( ${PYTHON_REQUIRED_USE} )"

CONFIG_CHECK="~FANOTIFY"

pkg_setup() {
	use powertop && python-single-r1_pkg_setup
}

src_install() {
	dosbin fatrace
	use powertop && dosbin power-usage-report

	doman fatrace.1
	dodoc NEWS
}
