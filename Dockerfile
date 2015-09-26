FROM phusion/baseimage:0.9.17
MAINTAINER hiroaki0404@gmail.com

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update
RUN apt-get install -y quickml

RUN mkdir /var/run/quickml
RUN chown list:list /var/run/quickml
RUN sed -i s/127.0.0.1/0.0.0.0/ /etc/quickml/quickmlrc
RUN sed -i 's/^.*:message_catalog.*$//' /etc/quickml/quickmlrc
RUN sed -i 's/^.*# :/  :/' /etc/quickml/quickmlrc
RUN sed -i 's/\(^.*:smtp_host =>\).*$/\1 "172.17.42.1",/' /etc/quickml/quickmlrc

RUN mkdir /etc/service/quickml
ADD quickml.sh /etc/service/quickml/run
RUN chmod +x /etc/service/quickml/run

ADD setup.sh /etc/rc.local
RUN chmod +x /etc/rc.local

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
