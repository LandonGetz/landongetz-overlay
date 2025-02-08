EAPI=8

DESCRIPTION="Live ebuild for Astal libraries (astal-io and astal3)"
HOMEPAGE="https://github.com/aylur/astal"
EGIT_REPO_URI="https://github.com/aylur/astal.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="
    dev-build/meson
    dev-lang/vala
    x11-libs/gtk+:3
    gui-libs/gtk-layer-shell
    dev-libs/gobject-introspection
"

RDEPEND="${DEPEND}"

src_prepare() {
	default
}

src_configure() {
	# Configure astal-io
	meson setup --prefix=/usr --buildtype=release build/io lib/astal/io

	# Configure astal3
	meson setup --prefix=/usr --buildtype=release build/gtk3 lib/astal/gtk3
}

src_compile() {
	# Compile astal-io
	meson compile -C build/io

	# Compile astal3
	meson compile -C build/gtk3
}

src_install() {
	# Install astal-io
	meson install -C build/io

	# Install astal3
	meson install -C build/gtk3
}
