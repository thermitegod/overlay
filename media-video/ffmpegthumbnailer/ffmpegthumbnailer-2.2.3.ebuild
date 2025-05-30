# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Lightweight video thumbnailer that can be used by file managers"
HOMEPAGE="https://github.com/dirkvdb/ffmpegthumbnailer"
SRC_URI="https://github.com/dirkvdb/ffmpegthumbnailer/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ppc ppc64 ~riscv sparc x86"
IUSE="gnome gtk jpeg png test"
RESTRICT="!test? ( test )"

REQUIRED_USE="gnome? ( gtk )
	test? ( png jpeg )"

BDEPEND="
	virtual/pkgconfig
"
RDEPEND="
	gtk? ( dev-libs/glib:2= )
	jpeg? ( virtual/jpeg:0= )
	>=media-video/ffmpeg-2.7:0=
	png? ( media-libs/libpng:0= )
"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS ChangeLog README.md )

src_prepare() {
	rm -rf out* || die

	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DENABLE_GIO=$(usex gtk)
		-DENABLE_TESTS=$(usex test)
		-DENABLE_THUMBNAILER=$(usex gnome)
		-DHAVE_JPEG=$(usex jpeg)
		-DHAVE_PNG=$(usex png)
	)
	cmake_src_configure
}
