# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="CPP Util Lib"
HOMEPAGE="https://github.com/thermitegod/ztd"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/thermitegod/${PN}.git"
	KEYWORDS="amd64 x86"
	# KEYWORDS=""
else
	SRC_URI="https://github.com/thermitegod/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="amd64 x86"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	dev-util/meson
	dev-util/ninja
	"
DEPEND="${RDEPEND}
	dev-libs/spdlog
	dev-libs/libfmt
	dev-libs/openssl
	"

src_configure() {
	meson_src_configure
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

