# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Unicode routines (UTF8, UTF16, UTF32): billions of characters per second using SSE2, AVX2, NEON, AVX-512. Part of Node.js and Bun."
HOMEPAGE="https://github.com/simdutf/simdutf"
SRC_URI="https://github.com/simdutf/simdutf/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE="+tools +iconv"

DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-DSIMDUTF_TESTS=OFF
		-DSIMDUTF_BENCHMARKS=OFF
		-DSIMDUTF_TOOLS=$(usex tools)
		-DSIMDUTF_ICONV=$(usex iconv)
	)

	cmake_src_configure
}

