# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Simple, fast, accurate single-header microbenchmarking functionality for C++11/14/17/20"
HOMEPAGE="https://github.com/martinus/nanobench"
SRC_URI="https://github.com/martinus/nanobench/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm ~arm64 ~ppc64 ~riscv ~sparc ~x86"

IUSE=""

BDEPEND=""
RDEPEND=""
DEPEND="${RDEPEND}"

PATCHES=(
    "${FILESDIR}/meson.patch"
)

src_configure() {
	rm README.md
    meson_src_configure
}

src_compile() {
    meson_src_compile
}

src_install() {
    meson_src_install
}

