# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

#inherit toolchain-funcs xdg flag-o-matic git-r3
inherit flag-o-matic git-r3

DESCRIPTION="JPEG XL image loader for imlib2"
HOMEPAGE="https://github.com/alistair7/imlib2-jxl"

EGIT_REPO_URI="https://github.com/alistair7/imlib2-jxl.git"

LICENSE="BSD"
SLOT="0"
IUSE=""

DEPEND="
	media-libs/libjxl
	media-libs/imlib2
	media-libs/lcms
"

BDEPEND=""

src_install() {
	# dostrip -x "${S}"/jxl.so
	dodir /usr/lib64/imlib2/loaders
	cp -r ${S}/jxl.so ${ED}/usr/lib64/imlib2/loaders
}

