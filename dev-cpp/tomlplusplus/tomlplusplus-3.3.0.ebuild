# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Header-only TOML config file parser and serializer for C++17"
HOMEPAGE="https://github.com/marzer/tomlplusplus"
SRC_URI="https://github.com/marzer/tomlplusplus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test +compile"
RESTRICT="!test? ( test ) test"

src_configure() {
	meson_src_configure \
		$(meson_use compile build_lib)
}
