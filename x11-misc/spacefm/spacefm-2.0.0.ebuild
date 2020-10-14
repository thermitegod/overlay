# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

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

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
IUSE="deprecated +gtk2 gtk3 +nls +startup-notification"

CONFIG_CHECK="~INOTIFY_USER"

RDEPEND="dev-libs/glib:2
	dev-util/desktop-file-utils
	>=dev-util/meson-0.49.0
	dev-libs/libbsd
	dev-vcs/git
	media-video/ffmpegthumbnailer
	>=virtual/udev-143
	virtual/freedesktop-icon-theme
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/pango
	x11-libs/libX11
	x11-misc/shared-mime-info
	gtk2? ( gtk3? ( x11-libs/gtk+:3 ) !gtk3? ( x11-libs/gtk+:2 ) )
	!gtk2? ( x11-libs/gtk+:3 )
	startup-notification? ( x11-libs/startup-notification )
	"
DEPEND="${RDEPEND}
	dev-util/intltool
	sys-devel/gettext
	virtual/pkgconfig
	"

src_configure() {
	meson_src_configure \
		$(meson_use startup-notification sn) \
		$(meson_use nls nls) \
		$(meson_use deprecated deprecated-hw) \
		$(meson_use gtk2 gtk2) \
		$(meson_use gtk3 gtk3)

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
	elog "To mount as non-root user you need one of the following:"
	elog "  sys-apps/udevil (recommended, see below)"
	elog "  sys-apps/pmount"
	elog "  sys-fs/udisks:0"
	elog "  sys-fs/udisks:2"
	elog "To support ftp/nfs/smb/ssh URLs in the path bar you may need:"
	elog "  sys-apps/udevil"
	elog "Other optional dependencies:"
	elog "  sys-apps/dbus"
	elog "  sys-process/lsof (device processes)"
	elog "  virtual/eject (eject media)"
	einfo
	if ! has_version 'sys-fs/udisks' ; then
		elog "When using SpaceFM without udisks, and without the udisks-daemon running,"
		elog "you may need to enable kernel polling for device media changes to be detected."
		elog "See /usr/share/doc/${PF}/html/spacefm-manual-en.html#devices-kernpoll"
		einfo
	fi
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
}
