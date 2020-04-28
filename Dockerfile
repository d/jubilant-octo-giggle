FROM debian:buster AS base
RUN apt-get update -q
RUN apt-get install -y \
	openssh-server \
	iputils-ping \
	net-tools \
	python-pip \
	gdb \
	g++ \
	make \
	cmake \
	bison \
	flex \
	ccache \
	ninja-build \
	libapr1-dev \
	libevent-dev \
	libxml2-dev \
	libbz2-dev \
	libssl-dev \
	zlib1g-dev \
	libzstd-dev \
	python-dev \
	libyaml-dev \
	libperl-dev \
	libreadline-dev \
	libcurl4-gnutls-dev \
	libkrb5-dev \
	locales \
	bzip2 \
	xz-utils \
	byobu \
	git \
	rsync \
	patch \
	vim \
	wget \
	gnupg \
	command-not-found \
	unzip \
	pigz \
	iproute2 \
	sudo

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

FROM base AS test
COPY test /tmp
RUN /tmp/test

FROM base
