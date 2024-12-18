# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Extremely fast, in memory, JSON and interface library for modern C++"
HOMEPAGE="https://github.com/stephenberry/glaze"
SRC_URI="https://github.com/stephenberry/glaze/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~riscv ~sparc ~x86"

CPU_USE=( cpu_flags_x86_avx2 )
IUSE="${CPU_USE[@]}"

BDEPEND=""
RDEPEND=""
DEPEND="${RDEPEND}"

src_configure() {
	if use amd64 ; then
		local mycmakeargs=(
			-Dglaze_ENABLE_AVX2=$(usex cpu_flags_x86_avx2)
		)
	fi

	local mycmakeargs+=(
		-DBUILD_TESTING=OFF
		-Dglaze_ENABLE_FUZZING=OFF
	)

	cmake_src_configure
}

