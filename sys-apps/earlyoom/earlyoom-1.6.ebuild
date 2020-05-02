# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Early OOM Daemon for Linux"
HOMEPAGE="https://github.com/rfjakob/earlyoom"

LICENSE="MIT-with-advertising"
SLOT="0"
if [ "${PV}" = "9999" ]; then
	EGIT_REPO_URI="https://github.com/rfjakob/earlyoom.git"
	inherit git-r3
else
	SRC_URI="https://github.com/rfjakob/earlyoom/archive/v$PV.tar.gz -> $P.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
IUSE="docs"

DEPEND="docs? ( app-text/pandoc )"
RDEPEND=""

src_compile() {
	VERSION="v${PV}" emake earlyoom
	use docs && VERSION="v${PV}" emake earlyoom.1
}

src_install() {
	dobin earlyoom
	use docs && doman earlyoom.1

	newinitd "${FILESDIR}"/${PN}.initd earlyoom
	newconfd "${FILESDIR}"/${PN}.confd earlyoom
}
