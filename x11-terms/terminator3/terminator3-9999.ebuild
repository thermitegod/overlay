# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1 virtualx git-r3

DESCRIPTION="Multiple GNOME terminals in one window"
HOMEPAGE="https://launchpad.net/terminator https://github.com/thermitegod/terminator3"
EGIT_REPO_URI="https://github.com/thermitegod/terminator3"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="+dbus"

RDEPEND="
	>=x11-libs/gtk+-3.16:3
	>=dev-libs/glib-2.32:2
	dev-python/psutil[${PYTHON_USEDEP}]
	x11-libs/vte:2.91[introspection]
	dbus? ( sys-apps/dbus )
	dev-python/pycairo[${PYTHON_USEDEP}]
	dev-python/pygobject:3[${PYTHON_USEDEP}]
"
DEPEND="
	dev-util/intltool
"

python_prepare_all() {
	local i p
	if [[ -n "${LINGUAS+x}" ]] ; then
		pushd "${S}"/po > /dev/null
		strip-linguas -i .
		for i in *.po; do
			if ! has ${i%.po} ${LINGUAS} ; then
				rm ${i} || die
			fi
		done
		popd > /dev/null
	fi

	distutils-r1_python_prepare_all
}

python_test() {
	VIRTUALX_COMMAND="esetup.py"
	virtualmake test
}
