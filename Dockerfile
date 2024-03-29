# QGIS Server 3.4 with Apache FCGI and Mapcache 1.6.1

FROM phusion/baseimage:0.11

MAINTAINER Stefan Ziegler

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get update && apt-get upgrade -y

#Fonts
RUN apt-get update && apt-get install -y ttf-dejavu ttf-bitstream-vera fonts-liberation ttf-ubuntu-font-family

RUN apt-get update && apt-get install -y fontconfig unzip

# Additional user fonts
COPY fonts/ /usr/share/fonts/truetype/

RUN fc-cache -f && fc-list | sort

#Headless X Server
RUN apt-get update && apt-get install -y xvfb

RUN mkdir /etc/service/xvfb
ADD xvfb-run.sh /etc/service/xvfb/run
RUN chmod +x /etc/service/xvfb/run

#Apache FCGI
RUN apt-get update && apt-get install -y apache2 libapache2-mod-fcgid

#QGIS Server and Mapcache
RUN echo "deb http://qgis.org/debian-ltr bionic main" > /etc/apt/sources.list.d/qgis.org-debian.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key CAEB3DC3BDF7FB45

RUN apt-get update && apt-get install -y qgis-server python-qgis libapache2-mod-mapcache mapcache-tools

RUN a2enmod rewrite
RUN a2enmod cgid
RUN a2enmod headers
RUN a2enmod mapcache

# Writeable dir for qgis_mapserv.log and qgis-auth.db
RUN mkdir /var/log/qgis && chown www-data:www-data /var/log/qgis
RUN mkdir /var/lib/qgis && chown www-data:www-data /var/lib/qgis
ARG URL_PREFIX=/qgis
ARG QGIS_SERVER_LOG_LEVEL=2
#ARG QGIS_FCGI_MIN_PROCESSES=8
#ARG QGIS_FCGI_MAX_PROCESSES=8
ARG QGIS_FCGI_CONNECTTIMEOUT=20
ARG QGIS_FCGI_IOTIMEOUT=90
ADD qgis-server.conf /etc/apache2/sites-enabled/qgis-server.conf
RUN sed -i "s!@URL_PREFIX@!$URL_PREFIX!g;\
            s!@QGIS_SERVER_LOG_LEVEL@!$QGIS_SERVER_LOG_LEVEL!g;\
            s!@QGIS_FCGI_CONNECTTIMEOUT@!$QGIS_FCGI_CONNECTTIMEOUT!g;\
            s!@QGIS_FCGI_IOTIMEOUT@!$QGIS_FCGI_IOTIMEOUT!g;" \
    /etc/apache2/sites-enabled/qgis-server.conf
RUN rm /etc/apache2/sites-enabled/000-default.conf

RUN mkdir /etc/service/apache2
ADD apache2-run.sh /etc/service/apache2/run
RUN chmod +x /etc/service/apache2/run

RUN mkdir /etc/service/dockerlog
ADD dockerlog-run.sh /etc/service/dockerlog/run
RUN chmod +x /etc/service/dockerlog/run

ADD pg_service.conf /etc/postgresql-common/

# Copy background map masking layer and seeding perimeters. 
COPY data/wmts-seeding-perimeter.gpkg /data/wmts-seeding-perimeter.gpkg
RUN chmod 777 /data/wmts-seeding-perimeter.gpkg

RUN mkdir /tiles
RUN mkdir /mapcache
COPY mapcache.xml /mapcache/mapcache.xml

COPY qgis/qgs/ch.so.agi.hintergrundkarte_ortho.qgs /data/ch.so.agi.hintergrundkarte_ortho.qgs
COPY qgis/qgs/ch.so.agi.hintergrundkarte_sw.qgs /data/ch.so.agi.hintergrundkarte_sw.qgs
COPY qgis/qgs/ch.so.agi.hintergrundkarte_farbig.qgs /data/ch.so.agi.hintergrundkarte_farbig.qgs
COPY qgis/qgs/ch.bl.agi.lidar_2018.dsm_hillshade.qgs /data/ch.bl.agi.lidar_2018.dsm_hillshade.qgs
COPY qgis/qgs/ch.bl.agi.lidar_2018.dtm_hillshade.qgs /data/ch.bl.agi.lidar_2018.dtm_hillshade.qgs
COPY qgis/qgs/ch.bl.agi.lidar_2018.dtm_slope.qgs /data/ch.bl.agi.lidar_2018.dtm_slope.qgs
COPY qgis/qgs/ch.bl.agi.lidar_2018.ndsm_buildings.qgs /data/ch.bl.agi.lidar_2018.ndsm_buildings.qgs
COPY qgis/qgs/ch.bl.agi.lidar_2018.ndsm_vegetation.qgs /data/ch.bl.agi.lidar_2018.ndsm_vegetation.qgs
COPY qgis/qgs/ch.so.agi.orthofoto_1993.grau.qgs /data/ch.so.agi.orthofoto_1993.grau.qgs
COPY qgis/qgs/ch.so.agi.orthofoto_2002.rgb.qgs /data/ch.so.agi.orthofoto_2002.rgb.qgs
COPY qgis/qgs/ch.so.agi.orthofoto_2006.rgb.qgs /data/ch.so.agi.orthofoto_2006.rgb.qgs
COPY qgis/qgs/ch.so.agi.orthofoto_2007.rgb.qgs /data/ch.so.agi.orthofoto_2007.rgb.qgs

EXPOSE 80

VOLUME ["/data"]
VOLUME ["/tiles"]

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up downloaded packages
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
