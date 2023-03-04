# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools xdg

DESCRIPTION="OpenZone mouse cursor theme for X11 and Wayland."
HOMEPAGE="https://github.com/ducakar/openzone-cursors"
SRC_URI="https://github.com/ducakar/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sparc x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"
# This ebuild does not install any binaries
RESTRICT="binchecks strip"

BDEPEND="media-gfx/icon-slicer"

src_install() {
	#emake DESTDIR="${ED}" install
	emake DESTDIR="${ED}/usr" install
	#emake DESTDIR="${EROOT}/usr" install
	einstalldocs
}

