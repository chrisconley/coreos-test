FROM centos
MAINTAINER Chris Conley <chris.m.conley@gmail.com>

RUN yum -y upgrade

RUN yum install -y haproxy

ADD haproxy.cfg /tmp/haproxy.cfg

EXPOSE 80
EXPOSE 7900

# Start haproxy
ENTRYPOINT ["haproxy", "-db", "-f", "/tmp/haproxy.cfg"]
