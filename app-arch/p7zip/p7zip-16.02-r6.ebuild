# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

WX_GTK_VER="3.0"

inherit eutils toolchain-funcs

DESCRIPTION="Port of 7-Zip archiver for Unix"
HOMEPAGE="http://p7zip.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}_src_all.tar.bz2"

LICENSE="LGPL-2.1 rar? ( unRAR )"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris"
IUSE="abi_x86_x32 clang doc +pch rar static"

DEPEND="${RDEPEND}
	abi_x86_x32? ( >=dev-lang/yasm-1.2.0-r1 )
	amd64? ( dev-lang/yasm )
	clang? ( sys-devel/clang )
	x86? ( dev-lang/nasm )"

S=${WORKDIR}/${PN}_${PV}

DOCS=( ChangeLog README TODO )

PATCHES=(
	"${FILESDIR}"/${P}-darwin.patch
	"${FILESDIR}"/CVE-2016-9296.patch
	"${FILESDIR}"/CVE-2017-17969.patch
	"${FILESDIR}"/CVE-2018-5996.patch
	"${FILESDIR}"/CVE-2018-10115.patch
	"${FILESDIR}"/WimHandler.cpp.patch
)

src_prepare() {
	default

	if ! use pch; then
		sed "s:PRE_COMPILED_HEADER=StdAfx.h.gch:PRE_COMPILED_HEADER=:g" -i makefile.* || die
	fi

	sed \
		-e 's|-m32 ||g' \
		-e 's|-m64 ||g' \
		-e 's|-pipe||g' \
		-e "/[ALL|OPT]FLAGS/s|-s||;/OPTIMIZE/s|-s||" \
		-e "/CFLAGS=/s|=|+=|" \
		-e "/CXXFLAGS=/s|=|+=|" \
		-i makefile* || die

	# remove non-free RAR codec
	if use rar; then
		ewarn "Enabling nonfree RAR decompressor"
	else
		sed \
			-e '/Rar/d' \
			-e '/RAR/d' \
			-i makefile* CPP/7zip/Bundles/Format7zFree/makefile || die
		rm -rf CPP/7zip/Compress/Rar || die
	fi

	if use abi_x86_x32; then
		sed -i -e "/^ASM=/s:amd64:x32:" makefile* || die
		cp -f makefile.linux_amd64_asm makefile.machine || die
	elif use amd64; then
		if use clang; then
			cp -f makefile.linux_clang_amd64_asm makefile.machine || die
		else
			cp -f makefile.linux_amd64_asm makefile.machine || die
		fi
	elif use x86; then
		cp -f makefile.linux_x86_asm_gcc_4.X makefile.machine || die
	elif [[ ${CHOST} == *-darwin* ]] ; then
		# Mac OS X needs this special makefile, because it has a non-GNU
		# linker, it doesn't matter so much for bitwidth, for it doesn't
		# do anything with it
		cp -f makefile.macosx_llvm_64bits makefile.machine
		# bundles have extension .bundle but don't die because USE=-rar
		# removes the Rar directory
		sed -i -e '/strcpy(name/s/\.so/.bundle/' \
			CPP/Windows/DLL.cpp || die
		sed -i -e '/^PROG=/s/\.so/.bundle/' \
			CPP/7zip/Bundles/Format7zFree/makefile.list \
			$(use rar && echo CPP/7zip/Compress/Rar/makefile.list) || die
	elif use x86-fbsd; then
		# FreeBSD needs this special makefile, because it hasn't -ldl
		sed -e 's/-lc_r/-pthread/' makefile.freebsd > makefile.machine
	fi

	if use static; then
		sed -i -e '/^LOCAL_LIBS=/s/LOCAL_LIBS=/&-static /' makefile.machine || die
	fi
}

src_compile() {
	emake all3
	#emake CC=$(tc-getCC) CXX=$(tc-getCXX) all3 #breaks clang build???
}

src_test() {
	emake test test_7z test_7zr
}

src_install() {
	# this wrappers can not be symlinks, p7zip should be called with full path
	make_wrapper 7zr "/usr/$(get_libdir)/${PN}/7zr"
	make_wrapper 7za "/usr/$(get_libdir)/${PN}/7za"
	make_wrapper 7z "/usr/$(get_libdir)/${PN}/7z"

	dobin contrib/gzip-like_CLI_wrapper_for_7z/p7zip
	doman contrib/gzip-like_CLI_wrapper_for_7z/man1/p7zip.1

	exeinto /usr/$(get_libdir)/${PN}
	doexe bin/7z bin/7za bin/7zr bin/7zCon.sfx
	doexe bin/*$(get_modname)
	if use rar; then
		exeinto /usr/$(get_libdir)/${PN}/Codecs/
		doexe bin/Codecs/*$(get_modname)
	fi

	doman man1/7z.1 man1/7za.1 man1/7zr.1

	if use doc; then
		dodoc DOC/*.txt
		docinto html
		dodoc -r DOC/MANUAL/*
	fi
}
