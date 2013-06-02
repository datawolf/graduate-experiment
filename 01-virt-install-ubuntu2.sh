virt-install \
--name ubuntu2 \
--ram 512 \
--vcpus 2 \
--disk /var/lib/libvirt/images/ubuntu2.img,size=8 \
--cdrom /var/lib/libvirt/images/ubuntu-11.10-server-i386.iso \
--network bridge=br0  \
--vnc \
--noautoconsole \
--os-type linux \
--accelerate \
--hvm
