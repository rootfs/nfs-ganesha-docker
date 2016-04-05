FROM fedora:22
MAINTAINER Huamin Chen, hchen@redhat.com

RUN dnf install -y nfs-ganesha nfs-ganesha-vfs
RUN mkdir -p /exports
EXPOSE 2049/tcp
ADD vfs.conf /vfs.conf
ENTRYPOINT ["ganesha.nfsd", "-F", "-L", "/var/log/ganesha.log", "-f", "/vfs.conf"]
