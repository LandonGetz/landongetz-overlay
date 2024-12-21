# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A graphics module for Hyprland, providing advanced rendering features"
HOMEPAGE="https://github.com/hyprwm/hyprgraphics"
EGIT_REPO_URI="https://github.com/hyprwm/hyprgraphics.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND="
    media-libs/libjxl
"
RDEPEND="${DEPEND}"
BDEPEND="sys-devel/clang"

inherit git-r3 cmake

S="${WORKDIR}/${PN}"

src_configure() {
	cmake_src_configure
}

src_compile() {
	cmake_src_compile
}

src_install() {
	cmake_src_install

}
