# Copyright 1999-2019 Gentoo Authors
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
IUSE=""

RDEPEND="${DEPEND}
	virtual/jpeg
	dev-python/pillow[${PYTHON_USEDEP}]
	x11-libs/gdk-pixbuf
	!media-gfx/comix
	!media-gfx/mcomix"

src_prepare() {
	distutils-r1_src_prepare
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
	echo
	elog "Additional packages are required to open the most common comic archives:"
	elog
	elog "    cbr: app-arch/unrar"
	elog "    cbz: app-arch/unzip"
	elog
	elog "You can also add support for 7z or LHA archives by installing"
	elog "app-arch/p7zip or app-arch/lha. Install app-text/mupdf for"
	elog "pdf support."
	echo
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}
