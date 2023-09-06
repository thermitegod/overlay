# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Policy-driven snapshot management and replication tools for ZFS"
HOMEPAGE="https://github.com/jimsalterjrs/sanoid"

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/jimsalterjrs/${PN}.git"
	KEYWORDS="**"
else
	SRC_URI="https://github.com/jimsalterjrs/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~x86 ~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND="app-arch/lzop
		dev-perl/Config-IniFiles
		dev-perl/Capture-Tiny
		sys-apps/pv
		sys-block/mbuffer
		virtual/perl-Data-Dumper"
RDEPEND="${DEPEND}"
BDEPEND=""

DOCS=( README.md )

src_install() {
	dobin findoid
	dobin sanoid
	# dobin sleepymutex
	dobin syncoid
	keepdir /etc/${PN}
	insinto /etc/${PN}
	doins sanoid.conf
	doins sanoid.defaults.conf
	insinto /etc/cron.d
	newins "${FILESDIR}/${PN}.cron" ${PN}
}

