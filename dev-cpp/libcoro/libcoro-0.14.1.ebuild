# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++20 coroutine library"
HOMEPAGE="https://github.com/jbaldwin/libcoro"
SRC_URI="https://github.com/jbaldwin/libcoro/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~riscv ~sparc ~x86"

IUSE="+network"

BDEPEND="
	network? (
		net-dns/c-ares
		dev-libs/openssl
	)
"
RDEPEND=""
DEPEND="${RDEPEND}"

PATCHES=(
    "${FILESDIR}/cmake.patch"
)

src_prepare() {
	rm -r vendor || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DLIBCORO_BUILD_TESTS=OFF
		-DLIBCORO_BUILD_EXAMPLES=OFF
		-DLIBCORO_FEATURE_NETWORKING=$(usex network)
		-DLIBCORO_FEATURE_TLS=$(usex network)
		-DLIBCORO_BUILD_SHARED_LIBS=OFF
	)
	cmake_src_configure
}

