# Contributor: Ivan N. Veselov <veselov@gmail.com>
# Maintainer: Ivan N. Veselov <veselov@gmail.com>

pkgname=wifi-select
pkgver=0.6
pkgrel=1
pkgdesc="Tool for selecting wifi networks in console"
arch=(i686 x86_64)
url="http://hg.horna.org.ua/wifi-select/"
license=('GPL2')
depends=('netcfg')
source=(http://hg.horna.org.ua/wifi-select/archive/216e7962c6a8.tar.gz)
md5sums=('65ab937f27cff114bd3e7535f4d39889')

build() {
  cd "$srcdir/$pkgname-216e7962c6a8"
  install -D -m 755 wifi-select $startdir/pkg/usr/bin/wifi-select
  install -D -m 644 parse-iwlist.awk $startdir/pkg/usr/lib/network/parse-iwlist.awk
}
