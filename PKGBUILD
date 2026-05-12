# Maintainer: deo-user <moribundmurdoch@gmail.com>
pkgname=mflash-common
pkgver=1.1.0
pkgrel=1
pkgdesc="Native Linux system integrations and thumbnailers for the .mflash deck format"
arch=('any')
url="https://github.com/deo-user/mflash-os-integrations"
license=('Unlicense')
groups=('mflash-suite')
depends=('unzip' 'shared-mime-info')
optdepends=('nemo: for Cinnamon desktop previews')
source=("mflash-common-linux.tar.gz")
sha256sums=('7ba7ce2d11b891f5677387f34c93e009c189dcad028d66739b7d05ab8cc91345')
install=mflash-common.install

package() {
  cd "$srcdir"

  # 1. Install MIME type definition
  install -Dm644 "$srcdir/mflash-common-linux/linux/thumbnailer/mflash.xml" \
    "$pkgdir/usr/share/mime/packages/mflash.xml"

  # 2. Install the thumbnailer shell script
  install -Dm755 "$srcdir/mflash-common-linux/linux/thumbnailer/mflash-thumbnailer" \
    "$pkgdir/usr/bin/mflash-thumbnailer"

  # 3. Install the thumbnailer desktop hook
  install -Dm644 "$srcdir/mflash-common-linux/linux/thumbnailer/mflash.thumbnailer" \
    "$pkgdir/usr/share/thumbnailers/mflash.thumbnailer"

  # 4. Install LICENSE
  install -Dm644 "$srcdir/mflash-common-linux/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}