# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="toml11 is a C++11 (or later) header-only toml parser/encoder depending only on C++ standard library."
HOMEPAGE="https://github.com/ToruNiina/toml11"
SRC_URI="https://github.com/ToruNiina/toml11/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
# Tests fail to compile
RESTRICT="!test? ( test ) test"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=20
		-Dtoml11_BUILD_TEST=$(usex test)
		-Dtoml11_INSTALL=ON
	)

	cmake_src_configure
}
