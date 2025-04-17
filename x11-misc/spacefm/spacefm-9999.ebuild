# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info xdg-utils meson

DESCRIPTION="A multi-panel tabbed file manager"
HOMEPAGE="https://github.com/thermitegod/spacefm"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/thermitegod/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/thermitegod/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="deprecated +socket +media +system-cli11 +system-concurrencpp +system-glaze +system-magic-enum +system-spdlog system-toml11 +system-ztd"

CONFIG_CHECK="~INOTIFY_USER"

BDEPEND="
	dev-build/ninja
	dev-build/meson
	virtual/pkgconfig
"
RDEPEND="
	dev-libs/glib:2
	dev-util/desktop-file-utils
	media-video/ffmpegthumbnailer
	virtual/udev
	virtual/freedesktop-icon-theme
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/pango
	x11-misc/shared-mime-info
	x11-misc/xdg-utils
	x11-libs/gtk+:3
	dev-cpp/gtkmm:3.0
	xfce-base/exo
	dev-libs/botan
	dev-libs/pugixml
	socket? ( net-libs/cppzmq )
	media? ( media-libs/gexiv2 )
	system-cli11? ( dev-cpp/cli11 )
	system-concurrencpp? ( dev-cpp/concurrencpp )
	system-glaze? ( dev-cpp/glaze )
	system-magic-enum? ( >=dev-cpp/magic_enum-0.9.7 )
	system-spdlog? ( dev-libs/spdlog )
	system-toml11? ( dev-cpp/toml11 )
	system-ztd? ( >=dev-cpp/ztd-0.4.0 )
"
DEPEND="${RDEPEND}"

RDEPEND="
	app-arch/file-roller
"

src_configure() {
	local emesonargs=(
		$(meson_use socket socket)
		$(meson_use media media)
		$(meson_use system-cli11 with-system-cli11)
		$(meson_use system-concurrencpp with-system-concurrencpp)
		$(meson_use system-glaze with-system-glaze)
		$(meson_use system-magic-enum with-system-magic-enum)
		$(meson_use system-spdlog with-system-spdlog)
		$(meson_use system-ztd with-system-ztd)
	)
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
	einstalldocs
	doman doc/*.1
	doman doc/*.7
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update

	einfo
	elog "To mount you need the following:"
	elog "  sys-fs/udiskie"
	elog "To open, create, and extract archives:"
	elog "  app-arch/file-roller"
	einfo
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}

