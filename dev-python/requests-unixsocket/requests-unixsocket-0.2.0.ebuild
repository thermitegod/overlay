# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PYTHON_COMPAT=( python3_{6,7,8,9} )

inherit distutils-r1

HOMEPAGE="https://pypi.org/project/requests-unixsocket"
DESCRIPTION="HTTP via a UNIX domain socket"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-python/requests-2.6[${PYTHON_USEDEP}]"
