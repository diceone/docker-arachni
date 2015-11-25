FROM centos:latest
MAINTAINER Dr.Doom doom@dev-ops.de

ENV PKG_NAME arachni
ENV PKG_VER 1.1-0.5.7-linux-x86_64
ENV PKG_FILE ${PKG_NAME}-${PKG_VER}.tar.gz
ENV PKG_URL http://downloads.arachni-scanner.com/${PKG_FILE}

RUN yum -y update && yum install -y wget tar
RUN \
 wget -P / ${PKG_URL} \
 && tar -xvzf /${PKG_FILE} -C / \
 && rm -f /${PKG_FILE} \
 && mv arachni* arachni

EXPOSE 9292
VOLUME ["/arachni/system/arachni-ui-web/db"]

WORKDIR /arachni
CMD ["bin/arachni_web"]
