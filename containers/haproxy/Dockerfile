FROM centos
MAINTAINER Chris Conley <chris.m.conley@gmail.com>

RUN yum -y upgrade

RUN yum install -y haproxy

ADD haproxy.cfg /tmp/haproxy.cfg
ADD restart-haproxy.py /tmp/

ADD etcd-v0.2.0-rc2-Linux-x86_64/etcd /usr/local/bin/etcd
ADD etcd-v0.2.0-rc2-Linux-x86_64/etcdctl /usr/local/bin/etcdctl

ADD start.sh /tmp/
RUN chmod +x /tmp/start.sh

EXPOSE 80
EXPOSE 7900

#ENTRYPOINT ["/tmp/start.sh"]
