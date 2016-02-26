FROM plone/plone:4.3.7
MAINTAINER "Alin Voinea" <alin.voinea@eaudeweb.ro>

ENV ZC_BUILDOUT=2.2.1 SETUPTOOLS=7.0 KGS_VERSION=6.0

COPY docker-initialize.py docker-setup.sh /
COPY src/* /tmp/

USER root
RUN /docker-setup.sh
USER plone

VOLUME /data/downloads/pdf /data/downloads/tmp