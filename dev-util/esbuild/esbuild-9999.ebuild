# dev-util/esbuild-9999.ebuild

EAPI=8

inherit git-r3 go-module

DESCRIPTION="An extremely fast JavaScript and CSS bundler and minifier"
HOMEPAGE="https://github.com/evanw/esbuild"
EGIT_REPO_URI="https://github.com/evanw/esbuild.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# build-time dependency
DEPEND=">=dev-lang/go-1.18"
RDEPEND="${DEPEND}"

src_unpack() {
	# 1) clone the live repo into ${S}
	git-r3_src_unpack
	# 2) prepare Go modules for vendoring
	go-module_src_unpack
}

src_prepare() {
	default
	# vendor all dependencies so build is reproducible
	go-module_live_vendor
}

src_compile() {
	# use the ego wrapper from go-module eclass for a clean 'go build'
	ego build \
		-trimpath \
		-ldflags="-s -w" \
		-o esbuild \
		./cmd/esbuild
}

src_install() {
	dodir /usr/bin
	dobin esbuild

	dodir "${ED}/usr/share/licenses/${PN}"
	doins LICENSE
}
