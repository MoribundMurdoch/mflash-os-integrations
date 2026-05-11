Name:           mflash-common
Version:        1.0.0
Release:        1
Summary:        Native Linux system integrations for the .mflash deck format
License:        MIT
URL:            https://github.com/deo-user/mflash-os-integrations
BuildArch:      noarch
Requires:       unzip, shared-mime-info

%description
Native Linux system integrations for the .mflash deck format.
Includes MIME type definitions and thumbnailer hooks for file managers.

%install
mkdir -p %{buildroot}/usr/bin
mkdir -p %{buildroot}/usr/share/mime/packages
mkdir -p %{buildroot}/usr/share/thumbnailers
mkdir -p %{buildroot}/usr/share/licenses/%{name}

cp %{_sourcedir}/linux/thumbnailer/mflash-thumbnailer %{buildroot}/usr/bin/
cp %{_sourcedir}/linux/thumbnailer/mflash.xml %{buildroot}/usr/share/mime/packages/
cp %{_sourcedir}/linux/thumbnailer/mflash.thumbnailer %{buildroot}/usr/share/thumbnailers/
cp %{_sourcedir}/LICENSE %{buildroot}/usr/share/licenses/%{name}/

%files
/usr/bin/mflash-thumbnailer
/usr/share/mime/packages/mflash.xml
/usr/share/thumbnailers/mflash.thumbnailer
/usr/share/licenses/mflash-common/LICENSE
