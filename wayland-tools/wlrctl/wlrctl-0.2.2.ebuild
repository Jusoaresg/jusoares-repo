EAPI=8

DESCRIPTION="Utility for miscellaneous wlroots extensions"

HOMEPAGE="https://git.sr.ht/~brocellous/wlrctl"

SRC_URI="https://git.sr.ht/~brocellous/wlrctl/archive/v${PV}.tar.gz"

S="${WORKDIR}/wlrctl-v${PV}"

LICENSE="unlicense"

SLOT="0"

KEYWORDS="~amd64"

IUSE=""

DEPEND=">=gui-libs/wlroots-0.18.1:* dev-build/meson"

RDEPEND="${DEPEND}"

BDEPEND=""

src_configure() {
    meson setup build --prefix=/usr || die "meson setup failed"
}

src_compile() {
    ninja -C build || die "build failed"
}

src_install() {
    DESTDIR="${D}" ninja -C build install || die "install failed"
}
