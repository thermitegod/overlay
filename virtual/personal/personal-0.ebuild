# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Packages that I required but no other packages depend on, avoid world clutter"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#EV - something
#Guard - something
#JSON - something
#send2trash - spacefm trash plugin
#beaker - caching for mako - mesa

DEPEND="
	dev-perl/EV
	dev-perl/Guard
	dev-perl/JSON
	dev-python/send2trash
	dev-python/beaker
"
RDEPEND="${DEPEND}"
