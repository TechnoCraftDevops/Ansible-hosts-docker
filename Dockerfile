FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./authorized_keys /root/.ssh/authorized_keys
RUN service ssh restart
EXPOSE 3306
EXPOSE 80
EXPOSE 443
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]