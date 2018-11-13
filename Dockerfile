FROM rust:stretch
MAINTAINER Parity Technologies <devops@parity.io>

WORKDIR /build

# install tools and dependencies
RUN apt-get -y update && \
  apt-get install -y --no-install-recommends \
	software-properties-common curl git \
	make cmake ca-certificates g++ rhash \
    gcc pkg-config libudev-dev

RUN cargo install cargo-audit

# show backtraces
ENV RUST_BACKTRACE 1

# cleanup
RUN apt-get autoremove -y
RUN apt-get clean -y
RUN rm -rf /tmp/* /var/tmp/*

# compiler ENV
ENV CC gcc
ENV CXX g++