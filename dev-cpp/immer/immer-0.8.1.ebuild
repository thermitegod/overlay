# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Postmodern immutable and persistent data structures for C++ — value semantics at scale"
HOMEPAGE="https://github.com/arximboldi/immer"
SRC_URI="https://github.com/arximboldi/immer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

RDEPEND="
	dev-libs/boost
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-libs/boehm-gc
"

src_configure() {
	local mycmakeargs=(
		-Dimmer_BUILD_TESTS=OFF
		-Dimmer_BUILD_EXAMPLES=OFF
		-Dimmer_BUILD_DOCS=OFF
	)

	cmake_src_configure
}

