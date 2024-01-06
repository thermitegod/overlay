# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="scanf for modern C++"
HOMEPAGE="https://github.com/eliaskosunen/scnlib"
SRC_URI="https://github.com/eliaskosunen/scnlib/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="doc"

DEPEND="${RDEPEND}"
BDEPEND="
	dev-cpp/fast_float
"

src_prepare() {
	rm -rf src/deps/fast_float || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DSCN_INSTALL=ON
		-DSCN_PEDANTIC=ON
		-DSCN_TESTS=OFF
		-DSCN_EXAMPLES=OFF
		-DSCN_BENCHMARKS=OFF
		-DSCN_USE_BUNDLED_FAST_FLOAT=OFF
		-DSCN_DOCS=$(usex doc)
	)

	cmake_src_configure
}

