# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1 xdg-utils

DESCRIPTION="A fork of mcomix, a GTK3 image viewer for comic book archives"
HOMEPAGE="https://github.com/thermitegod/mcomix-lite"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/thermitegod/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/thermitegod/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE=""

RDEPEND="${DEPEND}
	app-arch/p7zip
	app-arch/unrar
	dev-python/urllib3[${PYTHON_USEDEP}]
	>=dev-python/pillow-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-0.8.0[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	virtual/jpeg
	x11-libs/gdk-pixbuf
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
