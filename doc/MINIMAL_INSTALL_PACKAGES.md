Based on WombatLinux-LFS which is used to make a full development system.

If you are building Wombat Linux based on the LFS, Use this as a guide to get the bare essentials.

Anything used only to make other programs will be tagged `[build only]` to mark
that they were removed from the minimal system after serving their purpose for
building. You will not find these packages in your install.

- kernel headers
- musl
- adjust toolchain
- zlib
- file
- readline
- m4 [build only]
- bc 
- binutils [build only]
- shadow
- gmp [build only]
- mpfr [build only]
- mpc [build only]
- gcc [build only]
- bzip2
- ncurses
- attr
- acl
- libcap 
- sed
- zsh
- grep
- expat
- inetutils
- perl
- xml_parser 
- libtool [build only]
- autoconf [build only]
- automake [build only]
- musl_ftc
- musl_obstack
- musl_rpmatch
- xz
- kmod
- gettext [build only]
- libffi
- libressl
- diffutils
- gawk [build only]
- findutils
- less
- gzip 
- flex [build only]
- iproute2
- tar
- vim
- util_linux
- e2fsprogs
- gperf [build only]
- eudev
- zstd
- cpio
- sbase
- skalibs (execline, s6, and other stuff related to s6) 
- pkgconfig [build only]
- libtasn1
- p11-kit
- make-ca
- libcurl
- libuv
- libarchive
- cmake
- cjson
- libuspp
- uspm