# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-multilib

DESCRIPTION="zip manipulation library found in the zlib distribution"
HOMEPAGE="https://github.com/nmoinvaz/minizip"
SRC_URI="https://github.com/nmoinvaz/minizip/archive/${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="ZLIB"
SLOT="0/2" # libminizip.so version

KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 ~riscv s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="bzip2 libressl lzma ssl test +zlib"

RDEPEND="
	bzip2? ( app-arch/bzip2 )
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:= )
	)
	zlib? ( sys-libs/zlib:=[-minizip(-)] )
"

DEPEND="${RDEPEND}"

multilib_src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DMZ_BUILD_TEST="$(usex test)"
		-DMZ_BUILD_UNIT_TEST="$(usex test)"
		-DMZ_COMPAT=ON
		-DMZ_ZLIB="$(usex zlib)"
		-DMZ_BZIP2="$(usex bzip2)"
		-DMZ_LZMA="$(usex lzma)"
		-DMZ_OPENSSL="$(usex ssl)"
		-DINSTALL_INC_DIR="${EPREFIX}/usr/include/${PN}"
	)
	cmake-utils_src_configure
}
