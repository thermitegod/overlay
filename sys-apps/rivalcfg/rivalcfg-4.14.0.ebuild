# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="CLI tool and Python library to configure SteelSeries gaming mice"
HOMEPAGE="https://github.com/flozz/rivalcfg"

SRC_URI="https://github.com/flozz/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~sparc x86"

LICENSE="WTFPL"
SLOT="0"
IUSE=""

RESTRICT="test"

RDEPEND="${DEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/hidapi[${PYTHON_USEDEP}]
"

