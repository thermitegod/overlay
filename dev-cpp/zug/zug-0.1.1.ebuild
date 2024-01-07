# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Transducers for C++ — Clojure style higher order push/pull sequence transformations"
HOMEPAGE="https://github.com/arximboldi/zug"
SRC_URI="https://github.com/arximboldi/zug/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"
BDEPEND=""

src_configure() {
	local mycmakeargs=(
		-Dzug_BUILD_TESTS=OFF
		-Dzug_BUILD_EXAMPLES=OFF
		-Dzug_BUILD_DOCS=OFF
	)

	cmake_src_configure
}

