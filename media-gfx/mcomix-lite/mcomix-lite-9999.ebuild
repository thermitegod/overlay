# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{11..14} )

inherit meson distutils-r1 xdg-utils

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
IUSE="webp"

DEPEND=""
RDEPEND="${DEPEND}
	dev-python/libarchive-c[${PYTHON_USEDEP}]
	dev-python/platformdirs[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/send2trash[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-libs/libbytesize[python,${PYTHON_USEDEP}]
	dev-python/tomli[${PYTHON_USEDEP}]
	dev-python/tomli-w[${PYTHON_USEDEP}]
	virtual/jpeg
	x11-libs/gdk-pixbuf
	webp? ( gui-libs/gdk-pixbuf-loader-webp )
	!media-gfx/comix
	!media-gfx/mcomix"

BDEPEND="
	${RDEPEND}
	>=dev-build/meson-1.1.0
"

python_install_all() {
	doman man/mcomix.1

	# meson-python does not install non wheel files.
	# this is suboptimal.
	mv share/* "${ED}"/usr/share || die

	distutils-r1_python_install_all
}

