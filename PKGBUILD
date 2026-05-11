# Maintainer: deo-user <moribundmurdoch@gmail.com>
pkgname=mflash-common
pkgver=1.0.0
pkgrel=1
pkgdesc="Native Linux system integrations and thumbnailers for the .mflash deck format"
arch=('any')
url="https://github.com/deo-user/mflash-os-integrations"
license=('Unlicense')
groups=('mflash-suite')
depends=('unzip' 'shared-mime-info')
optdepends=('nemo: for Cinnamon desktop previews')
source=("mflash-common-linux.tar.gz")
sha256sums=('72aa57e5e37dfbb5893299d6705c228c703e480ad8ebaa2d626bddb72d3571b9')
install=mflash-common.install

package() {
  cd "$srcdir"

  # 1. Install MIME type definition
  install -Dm644 "linux/thumbnailer/mflash.xml" \
    "$pkgdir/usr/share/mime/packages/mflash.xml"

  # 2. Install the thumbnailer shell script
  install -Dm755 "linux/thumbnailer/mflash-thumbnailer" \
    "$pkgdir/usr/bin/mflash-thumbnailer"

  # 3. Install the thumbnailer desktop hook
  install -Dm644 "linux/thumbnailer/mflash.thumbnailer" \
    "$pkgdir/usr/share/thumbnailers/mflash.thumbnailer"

  # 4. Install LICENSE
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
