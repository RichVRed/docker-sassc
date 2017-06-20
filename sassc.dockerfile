# BUILD:
# docker build --force-rm --tag "rvannauker/sassc" --file sassc.dockerfile .
# RUN:
# docker run --rm --volume $(pwd):/workspace --name="sassc" "rvannauker/sassc" {destination}
# PACKAGE: sassc
# PACKAGE REPOSITORY: git@github.com:sass/sassc.git
# PACKAGE RELEASES: https://github.com/sass/sassc/releases
# PACKAGE DEPENDENCY: libsass
# PACKAGE DEPENDENCY REPOSITORY: git@github.com:sass/libsass.git
# PACKAGE DEPENDENCY RELEASES: https://github.com/sass/libsass/releases
# DESCRIPTION: SassC is a wrapper around libsass
FROM alpine:latest
MAINTAINER Richard Vannauker <richard.vannauker@gmail.com>
# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL     org.label-schema.schema-version="1.0" \
          org.label-schema.build-date="$BUILD_DATE" \
          org.label-schema.version="$VERSION" \
          org.label-schema.name="" \
          org.label-schema.description="" \
          org.label-schema.vendor="SEOHEAT LLC" \
          org.label-schema.url="" \
          org.label-schema.vcs-ref="$VCS_REF" \
          org.label-schema.vcs-url="" \
          org.label-schema.usage="" \
          org.label-schema.docker.cmd="" \
          org.label-schema.docker.cmd.devel="" \
          org.label-schema.docker.cmd.test="" \
          org.label-schema.docker.cmd.debug="" \
          org.label-schema.docker.cmd.help="" \
          org.label-schema.docker.params="" \
          org.label-schema.rkt.cmd="" \
          org.label-schema.rkt.cmd.devel="" \
          org.label-schema.rkt.cmd.test="" \
          org.label-schema.rkt.cmd.debug="" \
          org.label-schema.rkt.cmd.help="" \
          org.label-schema.rkt.params="" \
          com.amazonaws.ecs.task-arn="" \
          com.amazonaws.ecs.container-name="" \
          com.amazonaws.ecs.task-definition-family="" \
          com.amazonaws.ecs.task-definition-version="" \
          com.amazonaws.ecs.cluster=""

ENV LIBSASS_VERSION=3.4.5 SASSC_VERSION=3.4.5
ADD build.sh /tmp/
RUN /tmp/build.sh

ENTRYPOINT [ "sassc" ]