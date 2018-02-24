FROM centos

ENV BASH_ENV=/opt/app-root/etc/scl_enable \
  ENV=/opt/app-root/etc/scl_enable \
  PROMPT_COMMAND=". /opt/app-root/etc/scl_enable" \
  HOME=/home \
  ORIGIN_CLIENT=https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz


RUN yum -y update && \
    yum install -y centos-release-scl && \
    yum install -y wget && \
    yum-config-manager --enable centos-sclo-rh-testing && \
    yum remove -y origin-clients && \
    yum clean all -y

RUN wget -O $HOME/origin-client.tar.gz $ORIGIN_CLIENT && \
    tar -xzf $HOME/origin-client.tar.gz -C $HOME && \
    cp $HOME/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit/oc /usr/bin/oc && \
    rm -rf origin-client*
