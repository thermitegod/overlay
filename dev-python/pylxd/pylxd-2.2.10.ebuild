# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Python bindings for LXD"
HOMEPAGE="https://github.com/lxc/pylxd"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-python/ws4py[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
	dev-python/requests-unixsocket[${PYTHON_USEDEP}]
	dev-python/pbr[${PYTHON_USEDEP}]
	>=app-emulation/lxd-4.0.1"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]"
