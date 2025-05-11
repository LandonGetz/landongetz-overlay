# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Building blocks for building desktop shells"
HOMEPAGE="https://github.com/Aylur/astal"
EGIT_REPO_URI="https://github.com/Aylur/astal.git"

LICENSE="LGPL-2.1-only"
SLOT="0"
KEYWORDS=""
IUSE=""

# live ebuild
inherit git-r3 meson vala gnome2-utils

RDEPEND="
  x11-libs/gtk+:3
  gui-libs/gtk-layer-shell
  x11-libs/gdk-pixbuf
  dev-libs/glib:2
  dev-libs/libastal-io
  dev-libs/wayland
"

DEPEND="${RDEPEND}
  dev-util/meson
  dev-util/gobject-introspection
  dev-lang/vala
  dev-vcs/git
  dev-libs/wayland-protocols
"

S="${WORKDIR}/${PN}/lib/astal/gtk3"

src_configure() {
  meson setup "${WORKDIR}/${P}/build/io" "${WORKDIR}/${P}/lib/astal/io"
  meson setup "${WORKDIR}/${P}/build/gtk3" "${WORKDIR}/${P}/lib/astal/gtk3"
}

src_compile() {
  meson compile -C "${WORKDIR}/${P}/build/io"
  meson compile -C "${WORKDIR}/${P}/build/gtk3"
}

src_install() {
  DESTDIR="${D}" meson install -C "${WORKDIR}/${P}/build/io"
  DESTDIR="${D}" meson install -C "${WORKDIR}/${P}/build/gtk3"
}
