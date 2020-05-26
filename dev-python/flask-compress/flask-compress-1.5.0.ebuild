# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Compress responses in your Flask app"
HOMEPAGE="https://github.com/colour-science/flask-compress"
SRC_URI="https://github.com/colour-science/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/brotlipy[${PYTHON_USEDEP}]
	"
DEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests -v || die "Tests fail with ${EPYTHON}"
}
