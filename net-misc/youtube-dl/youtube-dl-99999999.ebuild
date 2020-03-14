# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{6,7,8} )
inherit bash-completion-r1 distutils-r1 git-r3 readme.gentoo-r1

DESCRIPTION="Download videos from YouTube.com (and more sites...)"
HOMEPAGE="https://github.com/ytdl-org/youtube-dl/"
EGIT_REPO_URI="https://github.com/ytdl-org/youtube-dl/"
LICENSE="public-domain"

KEYWORDS=""
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"
RDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	test? (
		dev-python/nose[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
	)
"

src_compile() {
	distutils-r1_src_compile

	emake ${PN}.{bash-completion,fish,zsh}
}

python_test() {
	emake offlinetest
}

python_install_all() {
	dodoc README.md

	newbashcomp ${PN}.bash-completion ${PN}

	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	insinto /usr/share/fish/vendor_completions.d
	doins ${PN}.fish

	distutils-r1_python_install_all

	rm -r "${ED}"/usr/etc || die
	rm -r "${ED}"/usr/share/doc/youtube_dl || die
}

