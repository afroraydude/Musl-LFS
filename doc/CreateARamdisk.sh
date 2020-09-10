#!/bin/sh

# From https://jootamam.net/howto-initramfs-image.htm

# First we set LFS Container
# assume there is a work subdirectory and a build subdirectory
# assume that the root filesystem is in the build subdirectory

# assume that initramfs is in the work directory
export LFS=/mnt/minimal/

# begin copy of bin files
cp /bin/{bash,mount,grep,umount} $LFS/work/initramfs/bin/
cp $LFS/build/usr/local/bin/echo $LFS/work/initramfs/bin/
cp $LFS/build/usr/local/bin/test $LFS/work/initramfs/bin/
cp $LFS/build/usr/local/bin/chroot $LFS/work/initramfs/bin/
cp $LFS/build/sbin/pivot_root $LFS/work/initramfs/bin/
ln -s bash $LFS/work/initramfs/bin/sh
ln -s test $LFS/work/initramfs/bin/[
# end copy of bin files

# begin copy of lib files
cp $LFS/build/usr/lib/libncursesw.so $LFS/work/initramfs/lib/
cp $LFS/build/usr/lib/libdl.a $LFS/work/initramfs/lib/
cp $LFS/build/usr/lib/libc.so $LFS/work/initramfs/lib/
cp $LFS/build/usr/lib/libreadline.so.8 $LFS/work/initramfs/lib/
ln -s libreadline.so.8 $LFS/work/initramfs/lib/libreadline.so
cp $LFS/build/usr/lib/libhistory.so.8 $LFS/work/initramfs/lib/
ln -s libhistory.so.8 $LFS/work/initramfs/lib/libhistory.so
cp $LFS/build/usr/lib/libblkid.so $LFS/work/initramfs/lib/
cp $LFS/build/usr/lib/libuuid.so $LFS/work/initramfs/lib/
ln -s libc.so $LFS/work/initramfs/lib/ld-musl-x86_64.so.1
# end copy of lib files

# add last programs
cp $LFS/build/usr/local/bin/cat $LFS/work/initramfs/bin/
cp $LFS/build/usr/local/bin/sleep $LFS/work/initramfs/bin/
cp $LFS/build/usr/local/bin/mknod $LFS/work/initramfs/bin/
# end copy of last programs

cd initramfs
find . | cpio -H newc -o > ../initramfs.cpio
cd ..
cat initramfs.cpio | gzip > initramfs.igz

umount output.iso && rm -rf output.iso 

mkisofs -o output.iso \
   -b isolinux/isolinux.bin -c isolinux/boot.cat \
   -no-emul-boot -boot-load-size 4 -boot-info-table \
   -D /mnt/minimal/build

umount output.iso && mount -o loop output.iso /mnt/cd