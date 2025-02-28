%define spec_release 1
%define kmod_name kvdo
%define kmod_driver_version @VERSION@
%define kmod_rpm_release %{spec_release}
%define kmod_kernel_version 3.10.0-957.el7

# Disable the scanning for a debug package
%global debug_package %{nil}

Source0: %{kmod_name}-%{kmod_driver_version}.tgz

Name: kmod-kvdo
Version: %{kmod_driver_version}
Release: %{kmod_rpm_release}
Summary: Kernel Modules for Virtual Data Optimizer
License: GPLv2+
URL: http://github.com/dm-vdo/kvdo
BuildRoot: %(mktemp -ud %{_tmppath}/%{name}-%{version}-%{release}-XXXXXX)
Requires: dkms
Requires: kernel-devel >= %{kmod_kernel_version}
Requires: make
ExcludeArch: s390
ExcludeArch: ppc
ExcludeArch: ppc64
ExcludeArch: i686

%description
dm-vdo is a device mapper target that delivers block-level
deduplication, compression, and thin provisioning.

%post
set -x
/usr/sbin/dkms --rpm_safe_upgrade add -m %{kmod_name} -v %{version}
/usr/sbin/dkms --rpm_safe_upgrade build -m %{kmod_name} -v %{version}
/usr/sbin/dkms --rpm_safe_upgrade install -m %{kmod_name} -v %{version}

%preun
# Check whether kvdo is loaded, and if so attempt to remove it.  A
# failure here means there is still something using the module, which
# should be cleared up before attempting to remove again.
for module in kvdo uds; do
  if grep -q "^${module}" /proc/modules; then
    modprobe -r ${module}
  fi
done
/usr/sbin/dkms --rpm_safe_upgrade remove -m %{kmod_name} -v %{version} --all || :

%prep
%setup -n %{kmod_name}-%{kmod_driver_version}

%build
# Nothing doing here, as we're going to build on whatever kernel we end up
# running inside.

%install
mkdir -p $RPM_BUILD_ROOT/%{_usr}/src/%{kmod_name}-%{version}
cp -r * $RPM_BUILD_ROOT/%{_usr}/src/%{kmod_name}-%{version}/
cat > $RPM_BUILD_ROOT/%{_usr}/src/%{kmod_name}-%{version}/dkms.conf <<EOF
PACKAGE_NAME="kvdo"
PACKAGE_VERSION="%{version}"
AUTOINSTALL="yes"

BUILT_MODULE_NAME[0]="kvdo"
DEST_MODULE_LOCATION[0]=/kernel/drivers/md
STRIP[0]="no"
EOF

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(644,root,root,755)
%{_usr}/src/%{kmod_name}-%{version}

%changelog
* Fri Jan 26 2024 - Bruce Johnston <bjohnsto@redhat.com> - 8.4.0.0-1
- Initial spec file for dmlinux tests. Spec file is distribution agnostic.
