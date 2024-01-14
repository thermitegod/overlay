# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils meson git-r3

DESCRIPTION="Quick Image Viewer"
HOMEPAGE="https://github.com/thermitegod/neoqiv"
EGIT_REPO_URI="https://github.com/thermitegod/neoqiv"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="exif lcms magic webp"

BDEPEND="
	dev-build/ninja
	dev-build/meson
	virtual/pkgconfig
"
RDEPEND="
	media-libs/imlib2[X]
	>=x11-libs/gtk+-2.12:2
	exif? ( media-libs/libexif )
	lcms? (
		media-libs/lcms:2
		media-libs/tiff:0
		virtual/jpeg:0
	)
	webp? ( gui-libs/gdk-pixbuf-loader-webp )
	magic? ( sys-apps/file )
"
DEPEND="${RDEPEND}"

src_configure() {
	meson_src_configure \
		$(meson_use magic magic) \
		$(meson_use lcms lcms) \
		$(meson_use exif exif)
}

src_install() {
	meson_src_install

	# dobin build/qiv
	doman man/qiv.1
	dodoc Changelog contrib/qiv-command.example README README.TODO

	domenu qiv.desktop
}

pkg_postinst() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_mimeinfo_database_update
	xdg_desktop_database_update
}

