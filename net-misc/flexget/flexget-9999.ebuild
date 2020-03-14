# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="Multipurpose automation tool for content like torrents, nzbs, podcasts, comics"
HOMEPAGE="http://flexget.com/"

EGIT_REPO_URI="https://github.com/Flexget/Flexget.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="
	dev-python/APScheduler[${PYTHON_USEDEP}]
	dev-python/babelfish[${PYTHON_USEDEP}]
	dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]
	dev-python/cherrypy[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/colorclass[${PYTHON_USEDEP}]
	dev-python/feedparser[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/flask-compress[${PYTHON_USEDEP}]
	dev-python/flask-cors[${PYTHON_USEDEP}]
	dev-python/flask-login[${PYTHON_USEDEP}]
	dev-python/flask-restplus[${PYTHON_USEDEP}]
	dev-python/guessit[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
	dev-python/loguru[${PYTHON_USEDEP}]
	dev-python/progressbar2[${PYTHON_USEDEP}]
	dev-python/pynzb[${PYTHON_USEDEP}]
	dev-python/PyRSS2Gen[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/rpyc[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/terminaltables[${PYTHON_USEDEP}]
	dev-python/tzlocal[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/werkzeug[${PYTHON_USEDEP}]
	dev-python/zxcvbn[${PYTHON_USEDEP}]
"
DEPEND+=" test? ( dev-python/nose[${PYTHON_USEDEP}] )"

if [[ ${PV} != 9999 ]]; then
	S="${WORKDIR}/${MY_P}"
fi

src_prepare(){
	default
	echo "" >| requirements.in
	echo "" >| requirements.txt
	rm flexget/components/sites/sites/hebits.py
}

