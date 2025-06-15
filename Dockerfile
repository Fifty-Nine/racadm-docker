FROM ubuntu:jammy

RUN apt-get update && \
    apt-get install -y gnupg wget libssl3 && \
    wget -qO- https://linux.dell.com/repo/pgp_pubkeys/0x1285491434D8786F.asc >/etc/apt/trusted.gpg.d/dell.asc && \
    echo 'deb https://linux.dell.com/repo/community/openmanage/11100/jammy jammy main' > /etc/apt/sources.list.d/linux.dell.com.sources.list && \
    echo "/bin/true" > /sbin/systemctl && \
    chmod +x /sbin/systemctl && \
    apt-get update && \
    apt-get install -y srvadmin-idracadm8 && \
    ln -s /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libssl.so

ENTRYPOINT ["/usr/bin/racadm"]
