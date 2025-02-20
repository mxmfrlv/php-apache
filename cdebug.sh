ln -sf /proc/$$/root/bin /proc/1/root/.cdebug
bin_created=False
lib_created=False
lib64_created=False
if [ ! -e proc/1/root/bin ] ; then
    ln -sf /proc/$$/root/bin /proc/1/root/bin
    bin_created=True
fi
if [ ! -e proc/1/root/lib ] ; then
    ln -sf /proc/$$/root/lib /proc/1/root/lib
    lib_created=True
fi
if [ ! -e proc/1/root/lib64 ] ; then
    ln -sf /proc/$$/root/lib64 /proc/1/root/lib64
    lib64_created=True
fi

ls -laF /proc/1/root/
export PATH=$PATH:/.cdebug
chroot /proc/1/root ash

if [ $bin_created = True ] ; then
    rm /proc/1/root/bin
fi 
if [ $lib_created = True ] ; then
    rm /proc/1/root/lib
fi
if [ $lib64_created = True ] ; then
    rm /proc/1/root/lib64
fi
rm /proc/1/root/.cdebug
