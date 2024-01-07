# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ library for value-oriented design using the unidirectional data-flow architecture — Redux for C++"
HOMEPAGE="https://github.com/arximboldi/lager"
SRC_URI="https://github.com/arximboldi/lager/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

RDEPEND="
	dev-libs/boost
	dev-cpp/immer
	dev-cpp/zug
"
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dlager_BUILD_TESTS=OFF
		-Dlager_BUILD_FAILURE_TESTS=OFF
		-Dlager_BUILD_EXAMPLES=OFF
		-Dlager_BUILD_DEBUGGER_EXAMPLES=OFF
		-Dlager_BUILD_DOCS=OFF
	)

	cmake_src_configure
}

