FROM tutum/apache-php
MAINTAINER Ergin BULUT <ergin@erginbulut.com>

RUN apt-get update \
	&& apt-get -yq install \
	wget \
	php5-memcache \
    && apt-get -y upgrade \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get autoremove

RUN a2enmod expires deflate headers rewrite
