# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 vcs-snapshot

if [[ ${PV} == "9999" ]] ; then
	AUTOTOOLS_AUTORECONF="1"
	EGIT_REPO_URI="https://github.com/thermitegod/trash-cli"
	inherit git-r3
else
	SRC_URI=""
	KEYWORDS="amd64"
fi

DESCRIPTION="Python scripts to manipulate trash cans via the command line"
HOMEPAGE="https://github.com/thermitegod/trash-cli"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/mock[${PYTHON_USEDEP}]
	)"

python_test() {
	nosetests -v || die
}
