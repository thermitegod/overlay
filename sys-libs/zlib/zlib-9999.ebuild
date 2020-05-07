# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
AUTOTOOLS_AUTO_DEPEND="no"

inherit autotools toolchain-funcs multilib multilib-minimal git-r3 usr-ldscript

DESCRIPTION="Standard (de)compression library"
HOMEPAGE="https://github.com/zlib-ng/zlib-ng"

EGIT_REPO_URI="https://github.com/zlib-ng/zlib-ng"

LICENSE="ZLIB"
SLOT="0/1" # subslot = SONAME
KEYWORDS=""
IUSE="static-libs minizip"

DEPEND="( ${AUTOTOOLS_DEPEND} )"
RDEPEND="minizip? ( sys-libs/minizip )"

multilib_src_configure() {
	# not an autoconf script, so can't use econf
	"${S}"/configure \
		--prefix="${EPREFIX}/usr" \
		--libdir="${EPREFIX}/usr/$(get_libdir)" \
		--zlib-compat \
		|| die
}

multilib_src_compile() {
	emake
}

multilib_src_install() {
	emake install DESTDIR="${D}" LDCONFIG=:

	use static-libs || rm -f "${ED}"/usr/$(get_libdir)/libz.{a,la} #419645
}
