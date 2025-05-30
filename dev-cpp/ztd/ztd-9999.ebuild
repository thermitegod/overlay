# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="ztd is a C++23 (or later) misc utility library"
HOMEPAGE="https://github.com/thermitegod/ztd"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/thermitegod/${PN}.git"
	KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux"
else
	SRC_URI="https://github.com/thermitegod/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

BDEPEND="
	dev-build/ninja
	dev-build/meson
	virtual/pkgconfig
"
RDEPEND="
	>=dev-cpp/magic_enum-0.9.7
"
DEPEND="${RDEPEND}"

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

