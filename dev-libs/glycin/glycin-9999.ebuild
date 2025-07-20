# dev-libs/glycin-9999.ebuild

EAPI=8

inherit git-r3 meson

DESCRIPTION="Sandboxed, modular image decoding library for GNOME"
HOMEPAGE="https://gitlab.gnome.org/GNOME/glycin"
EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/glycin.git"

# dual‑licensed MPL‑2.0 OR LGPL‑2.1-or-later
LICENSE="LGPL-2.1+ MPL-2.0" # :contentReference[oaicite:0]{index=0}
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
    dev-vcs/git
    dev-lang/rust
    dev-util/meson
    dev-util/ninja
    dev-util/pkgconf
    >=media-libs/lcms-2.14        # lcms2_req :contentReference[oaicite:1]{index=1}
    >=dev-libs/glib-2.60           # gio_req :contentReference[oaicite:2]{index=2}
    >=sys-libs/libseccomp-2.5.0      # seccomp_req :contentReference[oaicite:4]{index=4}
    >=dev-libs/fontconfig-2.13.0     # fontconfig_req :contentReference[oaicite:5]{index=5}
"

RDEPEND="
    >=media-libs/lcms-2.14
    >=dev-libs/glib-2.60
    sys-libs/libseccomp>=2.5.0
    dev-libs/fontconfig>=2.13.0
    sys-apps/bubblewrap
"

src_unpack() {
	git-r3_src_unpack
}

src_configure() {
	# enable the loaders, the C‐API bindings, and the GTK4 bindings
	meson_src_configure \
		-Dprofile=release \
		-Dlto=auto \
		-Dglycin-loaders=true \
		-Dlibglycin=true \
		-Dlibglycin-gtk4=true
}

src_compile() {
	meson_compile
}

src_install() {
	meson_install
}
