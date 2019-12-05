# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1

MY_PN="Flask-Compress"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A realistic password strength estimator"
HOMEPAGE="https://github.com/dwolfhub/zxcvbn-python"
SRC_URI="https://files.pythonhosted.org/packages/0e/2a/378bd072928f6d92fd8c417d66b00c757dc361c0405a46a0134de6fd323d/Flask-Compress-1.4.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm64 x86"
IUSE="test"

RDEPEND="
"
DEPEND="${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/${MY_P}"

python_test() {
	nosetests -v || die "Tests fail with ${EPYTHON}"
}

python_install_all() {
	distutils-r1_python_install_all
}
