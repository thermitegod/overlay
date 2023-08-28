# Copyright 1999-2023 Gentoo Authors
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
IUSE="deprecated"

CONFIG_CHECK="~INOTIFY_USER"

RDEPEND="
	dev-libs/glib:2
	dev-util/desktop-file-utils
	media-video/ffmpegthumbnailer
	>=virtual/udev-143
	virtual/freedesktop-icon-theme
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/pango
	x11-misc/shared-mime-info
	x11-libs/gtk+:3
	xfce-base/exo
	dev-cpp/glibmm:2.68
	dev-cpp/gtkmm:4.0
	dev-libs/spdlog
	dev-libs/libfmt
	dev-cpp/ztd
	dev-cpp/magic_enum
	dev-cpp/toml11
	dev-cpp/nlohmann_json
	dev-cpp/cli11
	dev-libs/pugixml
	net-libs/zmqpp
	"
DEPEND="${RDEPEND}
	dev-util/meson
	dev-util/ninja
	virtual/pkgconfig
	"

src_configure() {
	meson_src_configure \
		$(meson_use deprecated deprecated)
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
	elog "To mount as non-root user you need the following:"
	elog "  sys-fs/udiskie"
	elog "Other optional dependencies:"
	elog "  sys-apps/dbus"
	elog "  sys-process/lsof (device processes)"
	elog "  virtual/eject (eject media)"
	einfo
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
