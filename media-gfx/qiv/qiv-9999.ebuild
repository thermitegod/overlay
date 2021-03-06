# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop xdg-utils meson git-r3

DESCRIPTION="Quick Image Viewer"
HOMEPAGE="https://github.com/thermitegod/neoqiv"
EGIT_REPO_URI="https://github.com/thermitegod/neoqiv"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="exif lcms magic"

RDEPEND="
	>=dev-util/meson-0.49.0
	media-libs/imlib2[X]
	>=x11-libs/gtk+-2.12:2
	exif? ( media-libs/libexif )
	lcms? (
		media-libs/lcms:2
		media-libs/tiff:0
		virtual/jpeg:0
	)
	magic? ( sys-apps/file )"

DEPEND="${RDEPEND}
	virtual/pkgconfig"

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
