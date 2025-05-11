# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="IO library for libastal"
HOMEPAGE="https://github.com/Aylur/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal.git"

LICENSE="LGPL-2.1-only"
SLOT="0"
KEYWORDS=""
IUSE=""

inherit git-r3 meson vala

RDEPEND="
  dev-libs/glib:2
  sys-libs/glibc
"

DEPEND="${RDEPEND}
  dev-util/meson
  dev-util/gobject-introspection
  dev-lang/vala
  dev-vcs/git
"

S="${WORKDIR}/${P}"

src_configure() {
  meson setup "${S}/build" "${S}/lib/astal/io"
}

src_compile() {
  meson compile -C "${S}/build"
}

src_install() {
  DESTDIR="${D}" meson install -C "${S}/build"
}

