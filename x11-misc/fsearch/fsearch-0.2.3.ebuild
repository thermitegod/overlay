# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info xdg-utils meson

DESCRIPTION="A fast file search utility for Unix-like systems based on GTK3"
HOMEPAGE="https://github.com/cboxdoerfer/fsearch"
SRC_URI="https://github.com/cboxdoerfer/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="amd64 x86"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

BDEPEND="
	dev-build/ninja
	dev-build/meson
	virtual/pkgconfig
"
RDEPEND="
	dev-libs/glib:2
	dev-libs/icu
	dev-libs/libpcre2
	x11-libs/gtk+:3
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

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

