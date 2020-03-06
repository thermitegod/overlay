# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit cmake-multilib cmake-utils python-any-r1

SRC_URI="https://github.com/KhronosGroup/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="amd64 x86"

DESCRIPTION="Khronos reference front-end for GLSL and ESSL, and sample SPIR-V generator"
HOMEPAGE="https://www.khronos.org/opengles/sdk/tools/Reference-Compiler/"

LICENSE="BSD"
SLOT="0"

RDEPEND="!<media-libs/shaderc-2019-r1"
BDEPEND="${PYTHON_DEPS}"

# Bug 698850
RESTRICT="test"
