# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info xdg-utils meson

DESCRIPTION="A fork of mcomix, a GTK4 image viewer for manga and comic book archives"
HOMEPAGE="https://github.com/thermitegod/mcomix-lite"

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
IUSE="webp"

RDEPEND="${DEPEND}
	dev-cpp/cli11
	dev-cpp/glaze
	dev-libs/spdlog
	>=dev-cpp/magic_enum-0.9.7
	>=dev-cpp/ztd-0.4.0
	dev-cpp/gtkmm:4.0
	webp? ( gui-libs/gdk-pixbuf-loader-webp )
	!media-gfx/comix
	!media-gfx/mcomix"

BDEPEND="
	${RDEPEND}
	>=dev-build/meson-1.1.0
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		-Dwith-system-spdlog=true
		-Dwith-system-glaze=true
		-Dwith-system-spdlog=true
    )
	meson_src_configure
}

