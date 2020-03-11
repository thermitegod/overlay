# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} == "9999" ]] ; then
	AUTOTOOLS_AUTORECONF="1"
	EGIT_REPO_URI="https://github.com/thermitegod/mcomix-lite"
	inherit git-r3
else
	SRC_URI=""
	KEYWORDS="amd64"
fi

PYTHON_COMPAT=( python3_8 )

inherit distutils-r1 xdg-utils

DESCRIPTION="A fork of mcomix, a GTK3 image viewer for comic book archives"
HOMEPAGE="https://github.com/thermitegod/mcomix-lite"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+7z lha +pdf +rar"

RDEPEND="${DEPEND}
	virtual/jpeg
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	x11-libs/gdk-pixbuf
	7z? ( app-arch/p7zip )
	lha? ( app-arch/lha )
	pdf? ( app-text/mupdf )
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
