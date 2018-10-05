# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=(python{2_7,3_4,3_5,3_6})
# TODO: Add python3_5 once deps have it

inherit distutils-r1

if [[ ${PV} != 9999 ]]; then
	MY_P="FlexGet-${PV}"
	SRC_URI="mirror://pypi/F/FlexGet/${MY_P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
else
	inherit git-r3
	EGIT_REPO_URI="git://github.com/Flexget/Flexget.git
		https://github.com/Flexget/Flexget.git"
fi

DESCRIPTION="Multipurpose automation tool for content like torrents, nzbs, podcasts, comics"
HOMEPAGE="http://flexget.com/"

LICENSE="MIT"
SLOT="0"
IUSE="test"

#DEPEND="
#	dev-python/setuptools[${PYTHON_USEDEP}]
#	>=dev-python/feedparser-5.2.1[${PYTHON_USEDEP}]
#	>=dev-python/sqlalchemy-0.7.5[${PYTHON_USEDEP}]
#	<dev-python/sqlalchemy-1.999[${PYTHON_USEDEP}]
#	dev-python/pyyaml[${PYTHON_USEDEP}]
#	>=dev-python/beautifulsoup-4.5:4[${PYTHON_USEDEP}]
#	!~dev-python/beautifulsoup-4.2.0
#	>=dev-python/html5lib-0.11[${PYTHON_USEDEP}]
#	dev-python/PyRSS2Gen[${PYTHON_USEDEP}]
#	dev-python/pynzb[${PYTHON_USEDEP}]
#	dev-python/rpyc[${PYTHON_USEDEP}]
#	dev-python/jinja[${PYTHON_USEDEP}]
#	>=dev-python/requests-2.8.0[${PYTHON_USEDEP}]
#	<dev-python/requests-3.0[${PYTHON_USEDEP}]
#	dev-python/python-dateutil[${PYTHON_USEDEP}]
#	>=dev-python/jsonschema-2.0[${PYTHON_USEDEP}]
#	>=dev-python/path-py-8.1.1[${PYTHON_USEDEP}]
#	>=dev-python/pathlib2-1.0[${PYTHON_USEDEP}]
#	>=dev-python/guessit-2.0.4[${PYTHON_USEDEP}]
#	>=dev-python/APScheduler-3.0.3[${PYTHON_USEDEP}]
#	>=dev-python/pyparsing-2.0.3[${PYTHON_USEDEP}]
#	>=dev-python/future-0.15.2[${PYTHON_USEDEP}]
#	dev-python/itsdangerous[${PYTHON_USEDEP}]
#	dev-python/werkzeug[${PYTHON_USEDEP}]
#	dev-python/click[${PYTHON_USEDEP}]
#"
#DEPEND+=" test? ( dev-python/nose[${PYTHON_USEDEP}] )"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${MY_P}"
fi
