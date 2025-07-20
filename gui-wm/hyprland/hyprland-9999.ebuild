# dev-util/hyprland-9999.ebuild

EAPI=8

inherit git-r3 cmake-utils meson-utils

DESCRIPTION="A dynamic tiling Wayland compositor — live Git version"
HOMEPAGE="https://github.com/hyprwm/Hyprland"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
IUSE="X qtutils systemd hyprpm tracy_enable"

# hyprpm (plugin manager) needs these at runtime
HYPRPM_RDEPEND="
    app-alternatives/ninja
    >=dev-build/cmake-3.30
    dev-build/meson
    dev-vcs/git
    virtual/pkgconfig
"

RDEPEND="
    ${HYPRPM_RDEPEND}
    dev-cpp/tomlplusplus
    dev-libs/glib:2
    dev-libs/hyprlang
    dev-libs/libinput:=
    dev-libs/hyprgraphics:=
    dev-libs/re2:=
    >=dev-libs/udis86-1.7.2
    >=dev-libs/wayland-1.22.90
    >=gui-libs/aquamarine-0.4.2
    >=gui-libs/hyprcursor-0.1.9
    >=gui-libs/hyprutils-9999
    media-libs/libglvnd
    media-libs/mesa
    sys-apps/util-linux
    x11-libs/cairo
    x11-libs/libdrm
    x11-libs/libxkbcommon
    x11-libs/pango
    x11-libs/pixman
    x11-libs/libXcursor
    qtutils? ( gui-libs/hyprland-qtutils )
    X? (
        x11-libs/libxcb:0=
        x11-base/xwayland
        x11-libs/xcb-util-errors
        x11-libs/xcb-util-wm
    )
"

DEPEND="
    ${RDEPEND}
    >=dev-libs/wayland-protocols-1.36
"

BDEPEND="
    || ( >=sys-devel/gcc-14:* >=llvm-core/clang-18:* )
    app-misc/jq
    dev-build/cmake
    >=dev-util/hyprwayland-scanner-0.3.10
    virtual/pkgconfig
"

pkg_setup() {
	[[ ${MERGE_TYPE} == binary ]] && return

	if tc-is-gcc && ver_test $(gcc-version) -lt 14; then
		die "GCC >=14 is required to build Hyprland; please upgrade."
	elif tc-is-clang && ver_test $(clang-version) -lt 18; then
		die "Clang >=18 is required to build Hyprland; please upgrade."
	fi
}

src_configure() {
	local mesonopts=(
		$(meson_feature systemd)
		$(meson_feature X xwayland)
		$(meson_feature hyprpm)
		$(meson_feature tracy_enable)
	)
	meson_src_configure "${mesonopts[@]}"
}

src_compile() {
	meson_compile
}

src_install() {
	meson_install
}
