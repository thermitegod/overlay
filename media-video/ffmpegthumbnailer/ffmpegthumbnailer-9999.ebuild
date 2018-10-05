# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-utils eutils

if [[ ${PV} != *9999* ]]; then
	SRC_URI="https://github.com/dirkvdb/${PN}/releases/download/${PV}/${P}.tar.bz2"
else
	EGIT_REPO_URI="https://github.com/dirkvdb/ffmpegthumbnailer"
	#EGIT_BRANCH="deprecation"
	inherit git-r3
fi

DESCRIPTION="Lightweight video thumbnailer that can be used by file managers"
HOMEPAGE="https://github.com/dirkvdb/ffmpegthumbnailer"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 sparc x86 ~x86-fbsd"
IUSE="gnome gtk jpeg png test"

RDEPEND="
	gtk? ( dev-libs/glib:2= )
	jpeg? ( virtual/jpeg:0= )
	png? ( media-libs/libpng:0= )
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

REQUIRED_USE="gnome? ( gtk )
	test? ( png jpeg )
"

DOCS=( AUTHORS ChangeLog README.md )

src_prepare() {
	rm -rf out* || die
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_GIO=$(usex gtk)
		-DENABLE_TESTS=$(usex test)
		-DENABLE_THUMBNAILER=$(usex gnome)
		-DHAVE_JPEG=$(usex jpeg)
		-DHAVE_PNG=$(usex png)
	)
	cmake-utils_src_configure
}
