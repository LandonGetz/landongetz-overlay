# Copyright 2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# We inherit cargo.eclass to build Rust projects and git-r3 for live ebuilds.
inherit cargo git-r3

DESCRIPTION="Astal: The Linux Suite and Framework to Craft Desktop Shells and beautiful functional Wayland Widgets with GTK!"
HOMEPAGE="https://github.com/aylur/astal"
EGIT_REPO_URI="https://github.com/aylur/astal.git"

# Double check the license in the repository; it might be MIT, Apache-2.0, or something else.
LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

# You generally need a Rust compiler to build, plus cargo.
# If Astal has any optional system libraries, list them here as well.
DEPEND="
    dev-util/meson
    dev-lang/vala
    x11-libs/gtk+:3
    x11-libs/gtk-layer-shell
    dev-libs/gobject-introspection
"
RDEPEND="${DEPEND}"

# If cargo eclass requires crates to be declared, you can use `crate-metadata` or cargo_generate to populate CRATES.
# For most live ebuilds, cargo.eclass handles it automatically by vendorizing.

src_prepare() {
	default
	# Additional patching or adjustments can go here if needed
}

src_compile() {
	# By default, cargo_src_compile is provided by cargo.eclass
	# You can use the eclass function or call cargo directly:
	# cargo_src_compile
	cargo build --release
}

src_install() {
	# If using the cargo eclass function:
	# cargo_src_install

	# Or do it manually:
	exeinto /usr/bin
	doexe target/release/astal

	dodoc README.md
}
