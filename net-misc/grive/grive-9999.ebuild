# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="An open source Linux client for Google Drive"
HOMEPAGE="https://github.com/vitalif/grive2"

EGIT_REPO_URI="https://github.com/vitalif/${PN}2.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

	#|| ( net-misc/curl[curl_ssl_openssl] net-misc/curl[curl_ssl_gnutls] )
RDEPEND="
	dev-libs/boost:=
	dev-libs/expat
	>=dev-libs/json-c-0.11-r1:=
	dev-libs/libgcrypt:0=
	sys-libs/binutils-libs:0=
	sys-libs/glibc
	dev-libs/yajl
"
DEPEND="${RDEPEND}"
