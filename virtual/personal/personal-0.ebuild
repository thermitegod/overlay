# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Packages that I required but no other packages depend on"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#EV - ?
#Guard - ?
#JSON - ?
#sub32 - mconix
#send2trash - spacefm trash plugin
#tiff - qiv
#libexif - qiv
#gsettings-desktop-schemas - terminator
#beaker - caching for mako - mesa

#other
# dev-python/beaker

DEPEND="
	x11-themes/adwaita-icon-theme
	dev-perl/EV
	dev-perl/Guard
	dev-perl/JSON
	dev-python/subprocess32
	dev-python/send2trash
	media-libs/tiff
	media-libs/libexif
	dev-python/beaker
	gnome-base/gsettings-desktop-schemas
"
RDEPEND="${DEPEND}"
