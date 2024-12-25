# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Hyprland QT/qml utility apps"
HOMEPAGE="https://github.com/hyprwm/hyprland-qtutils"
EGIT_REPO_URI="https://github.com/hyprwm/hyprland-qtutils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
dev-qt/qtbase
kde-frameworks/qqc2-desktop-style
"
RDEPEND="${DEPEND}"
BDEPEND="llvm-core/clang"

inherit git-r3 cmake

src_configure() {
    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
}

