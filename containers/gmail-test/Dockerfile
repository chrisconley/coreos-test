FROM centos
MAINTAINER Chris Conley <chris.m.conley@gmail.com>

RUN yum -y upgrade

ADD install_rpm.sh /tmp/install_rpm.sh
RUN chmod 0755 /tmp/install_rpm.sh

RUN /tmp/install_rpm.sh python27-2.7.5-1.x86_64
RUN /tmp/install_rpm.sh bottle-0.11.6-1.noarch

EXPOSE 8080
EXPOSE 80

ADD app.py /tmp/app.py

ENTRYPOINT ["python2.7", "/tmp/app.py"]
