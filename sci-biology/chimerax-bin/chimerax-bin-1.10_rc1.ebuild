# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="UCSF ChimeraX molecular modeling system (binary)"
HOMEPAGE="https://www.cgl.ucsf.edu/chimerax/"
SRC_URI="https://www.cgl.ucsf.edu/chimerax/download.html"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror bindist fetch"

S=${WORKDIR}

src_unpack() {
	ar x "${DISTDIR}/${A}"
	tar -xf data.tar.* || die "Failed to extract data.tar"
}

src_install() {
	# Install files to /opt/chimerax
	dodir /opt/chimerax
	cp -r usr/lib/ucsf-chimerax/* "${D}/opt/chimerax/" || die "Copy failed"

	# Install symlink
	dosym /opt/chimerax/bin/ChimeraX /usr/bin/chimerax
}
