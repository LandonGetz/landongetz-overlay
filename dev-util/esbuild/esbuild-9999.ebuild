# dev-util/esbuild-9999.ebuild

EAPI=8

inherit git-r3 go-module

DESCRIPTION="An extremely fast JavaScript and CSS bundler and minifier"
HOMEPAGE="https://esbuild.github.io/ – upstream repo at GitHub"
# Fetch from the live Git repo:
SRC_URI=""
EGIT_REPO_URI="https://github.com/evanw/esbuild.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Build-time dependency on Go 1.18+ (modules support)
DEPEND=">=dev-lang/go-1.18"
RDEPEND="${DEPEND}"

src_unpack() {
	# Set up Go environment and clone the repo
	go-module_src_unpack
}

src_prepare() {
	# Vendor all Go module dependencies for a reproducible build
	go-module_live_vendor
	default
}

src_compile() {
	# Build the CLI binary
	ego build \
		-trimpath \
		-ldflags="-s -w" \
		-o esbuild \
		./cmd/esbuild
}

src_install() {
	# Install the binary
	dodir /usr/bin
	dobin esbuild

	# Install the license
	dodir /usr/share/licenses/${PN}
	doins LICENSE
}
