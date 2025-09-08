# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Accelerated string operations on modern CPUs"
HOMEPAGE="https://github.com/ashvardanian/StringZilla"
SRC_URI="https://github.com/ashvardanian/StringZilla/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/StringZilla-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

DEPEND=""
RDEPEND="${DEPEND}"

src_configure() {
	local mycmakeargs=(
		-DSTRINGZILLA_INSTALL=ON
		-DSTRINGZILLA_BUILD_BENCHMARK=OFF
		-DSTRINGZILLA_BUILD_SHARED=ON
		-DSTRINGZILLA_BUILD_TEST=$(usex test)
	)

	cmake_src_configure
}

