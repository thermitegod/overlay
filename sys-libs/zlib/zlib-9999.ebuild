# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
AUTOTOOLS_AUTO_DEPEND="no"

inherit autotools toolchain-funcs multilib multilib-minimal git-r3

DESCRIPTION="Standard (de)compression library"
HOMEPAGE="https://github.com/zlib-ng/zlib-ng"

EGIT_REPO_URI="https://github.com/zlib-ng/zlib-ng"

LICENSE="ZLIB"
SLOT="0/1" # subslot = SONAME
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 ~riscv s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="static-libs"

DEPEND="( ${AUTOTOOLS_DEPEND} )"

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
	gen_usr_ldscript -a z

	use static-libs || rm -f "${ED}"/usr/$(get_libdir)/lib{z,minizip}.{a,la} #419645
}

