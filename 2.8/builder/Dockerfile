FROM golang:1.22-alpine3.20

RUN apk add --no-cache \
	ca-certificates \
	git \
	libcap

ENV XKENGINE_VERSION v0.4.2
# Configures xkengine to build with this version of Kengine
ENV KENGINE_VERSION v2.8.4
# Configures xkengine to not clean up post-build (unnecessary in a container)
ENV XKENGINE_SKIP_CLEANUP 1
# Sets capabilities for output kengine binary to be able to bind to privileged ports
ENV XKENGINE_SETCAP 1

RUN set -eux; \
	apkArch="$(apk --print-arch)"; \
	case "$apkArch" in \
		x86_64)  binArch='amd64'; checksum='a726e4b7992f3c6c11c585b6100f796f035c6757d247110c6af9bb4f218b7ec67d07db0013c6834e9b881582d75ba4fe8e78f6ca5883b1017da6b5407d1ca25c' ;; \
		armhf)   binArch='armv6'; checksum='c0a94f2e59547fe5d4793ec2447ba0b832731c7b1387ae3c90e43f081da57ad68ab506de43ad91a35754a779b591dc5a39a92b6cf3b5ef352622cfb811e92157' ;; \
		armv7)   binArch='armv7'; checksum='4820d03ed4a805cf52803725fd1eda9d96f15692ab3cd2803fe91e676f1a24a48b31c4e6a1ec043e5f7f077f302e003e4997ca620c9674ed65e7804417a91af6' ;; \
		aarch64) binArch='arm64'; checksum='41033dc721e799583eac2014b6e409d65a704d0a4360c131662aa651e7fbd129dce03c460661a51e0ba192d27fb3af19faa054da8c037c642b24a12124f6d4a8' ;; \
		ppc64el|ppc64le) binArch='ppc64le'; checksum='ea454e90519f46eeaf785a5789d455a01378dc543838d0b57448509036f3a215913c8a6e1fcb0b9249e9b941f29a29257367609e1ef7ce7f2e0522c768eaf2cf' ;; \
		riscv64) binArch='riscv64'; checksum='afaf940189942adfe0518d06b42f2624f387a02d88ce9ec5f8cc5a99347e032e2dcae3e3cd5856ac1a6ce107a7654e62b04f635f1dd891ca192b23758946b45b' ;; \
		s390x)   binArch='s390x'; checksum='d8d3bf402107dad8f07ed9d5df008b3f6cfd021c93d00f6fc31c641d69649255f2e95d65a46553fb06bf9738158d0ba92d3bbd548e878f4569523b6e6fdeacb5' ;; \
		*) echo >&2 "error: unsupported architecture ($apkArch)"; exit 1 ;;\
	esac; \
	wget -O /tmp/xkengine.tar.gz "https://github.com/khulnasoft/xkengine/releases/download/v0.4.2/xkengine_0.4.2_linux_${binArch}.tar.gz"; \
	echo "$checksum  /tmp/xkengine.tar.gz" | sha512sum -c; \
	tar x -z -f /tmp/xkengine.tar.gz -C /usr/bin xkengine; \
	rm -f /tmp/xkengine.tar.gz; \
	chmod +x /usr/bin/xkengine;

COPY kengine-builder.sh /usr/bin/kengine-builder

WORKDIR /usr/bin
