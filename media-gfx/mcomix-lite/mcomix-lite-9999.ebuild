# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8,9} )

inherit distutils-r1 xdg-utils git-r3

DESCRIPTION="A fork of mcomix, a GTK3 image viewer for comic book archives"
HOMEPAGE="https://github.com/thermitegod/mcomix-lite"

EGIT_REPO_URI="https://github.com/thermitegod/mcomix-lite"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+7z +rar"

RDEPEND="${DEPEND}
	virtual/jpeg
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	x11-libs/gdk-pixbuf
	7z? ( app-arch/p7zip )
	rar? ( app-arch/unrar )
	!media-gfx/comix
	!media-gfx/mcomix"

src_prepare() {
	distutils-r1_src_prepare
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}
