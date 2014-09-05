FROM ubuntu:14.04
# Install required system packages
RUN apt-get update
RUN apt-get install -yq git-core build-essential autoconf libtool gettext libgdiplus libgtk2.0-0 xsltproc

# Install Mono
ADD ./mono /usr/src/mono
WORKDIR /usr/src/mono
RUN ./autogen.sh --prefix=/usr --with-mcs-docs=no
RUN make get-monolite-latest
RUN make
RUN make install
