# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="Fully featured framework for fast, easy and documented API development with Flask"
HOMEPAGE="https://github.com/python-restx/flask-restx"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="doc"

RDEPEND="
	>=dev-python/flask-0.8[${PYTHON_USEDEP}]
	>=dev-python/aniso8601-0.82[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

python_install_all() {
	distutils-r1_python_install_all
}
