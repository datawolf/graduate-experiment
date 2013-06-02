virt-install \
--name=ubuntu_1 \
--ram 512 \
--vcpus=2 \
--disk /var/lib/libvirt/images/ubuntu_1.img \
--graphics vnc,listen=0.0.0.0,port=5920,  \
--network bridge=br0  \
--import
