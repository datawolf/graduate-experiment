virt-install \
--name=ubuntu_2 \
--ram 512 \
--vcpus=2 \
--disk /var/lib/libvirt/images/ubuntu_2.img \
--graphics vnc,listen=0.0.0.0,port=5930,  \
--network bridge=br0  \
--import
