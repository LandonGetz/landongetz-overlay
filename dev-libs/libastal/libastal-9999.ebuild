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
  dev-build/meson
  dev-libs/gobject-introspection
  dev-lang/vala
  dev-vcs/git
"

src_configure() {
  meson setup "${WORKDIR}/astal/build/io" "${WORKDIR}/astal/lib/astal/io"
  meson setup "${WORKDIR}/astal/build/gtk3" "${WORKDIR}/astal/lib/astal/gtk3"
}

src_compile() {
  meson compile -C "${WORKDIR}/astal/build/io"
  meson compile -C "${WORKDIR}/astal/build/gtk3"
}

src_install() {
  DESTDIR="${D}" meson install -C "${WORKDIR}/astal/build/io"
  DESTDIR="${D}" meson install -C "${WORKDIR}/astal/build/gtk3"
}
