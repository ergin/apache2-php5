FROM tutum/apache-php
MAINTAINER Ergin BULUT <ergin@erginbulut.com>

RUN apt-get update \
	DEBIAN_FRONTEND=noninteractive apt-get -yq install \
	wget \
    && apt-get -y upgrade \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove

RUN a2enmod expires deflate headers rewrite
