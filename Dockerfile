## -*- docker-image-name: "scaleway/bareos:latest" -*-
FROM scaleway/ubuntu:amd64-trusty
# following 'FROM' lines are used dynamically thanks do the image-builder
# which dynamically update the Dockerfile if needed.
#FROM scaleway/ubuntu:armhf-trusty       # arch=armv7l
#FROM scaleway/ubuntu:arm64-trusty       # arch=arm64
#FROM scaleway/ubuntu:i386-trusty        # arch=i386
#FROM scaleway/ubuntu:mips-trusty        # arch=mips


MAINTAINER Scaleway <opensource@scaleway.com> (@scaleway)


# Prepare rootfs for image-builder
RUN /usr/local/sbin/scw-builder-enter


# Install packages
RUN echo deb http://download.bareos.org/bareos/release/15.2/xUbuntu_14.04/ / > /etc/apt/sources.list.d/bareos.list
RUN wget -q http://download.bareos.org/bareos/release/15.2/xUbuntu_14.04/Release.key -O- | apt-key add -
RUN apt-get -q update
RUN apt-get -y -qq upgrade
RUN echo bareos-database-common bareos-database-common/dbconfig-install boolean false | debconf-set-selections
RUN echo bareos-database-common bareos-database-common/install-error select ignore | debconf-set-selections
RUN echo bareos-database-common bareos-database-common/database-type select psql | debconf-set-selections
RUN echo bareos-database-common bareos-database-common/missing-db-package-error select ignore | debconf-set-selections
RUN echo postfix postfix/main_mailer_type select No configuration | debconf-set-selections
RUN apt-get -y -qq install bareos
RUN apt-get -y -qq install bareos-database-postgresql



#&& apt-get clean


# Clean rootfs from image-builder
RUN /usr/local/sbin/scw-builder-leave
