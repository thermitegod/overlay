# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit toolchain-funcs git-r3

DESCRIPTION="Simple command line utility to create BitTorrent metainfo files"
HOMEPAGE="https://github.com/Rudde/mktorrent"

EGIT_REPO_URI="https://github.com/Rudde/mktorrent.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS=""
IUSE="threads +ssl libressl debug"

RDEPEND="
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
"

DEPEND="${RDEPEND}"

src_compile() {
	tc-export CC

	local myemakeargs=(
		USE_LONG_OPTIONS=1
		USE_LARGE_FILES=1
		DEBUG=$(usex debug)
		USE_OPENSSL=$(usex ssl)
		USE_PTHREADS=$(usex threads)
		)
	emake "${myemakeargs[@]}"
}

src_install() {
	dobin ${PN}
	dodoc README
}
