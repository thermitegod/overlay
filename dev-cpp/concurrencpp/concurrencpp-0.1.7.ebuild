# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Modern concurrency for C++. Tasks, executors, timers and C++20 coroutines to rule them all"
HOMEPAGE="https://github.com/David-Haim/concurrencpp"
SRC_URI="https://github.com/David-Haim/concurrencpp/archive/refs/tags/v.${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-v.${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

src_configure() {
	cmake_src_configure
}

