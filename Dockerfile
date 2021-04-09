FROM debian:8 as build

MAINTAINER Michael Weiser <michael.weiser@atos.net>

WORKDIR /

RUN apt-get update && \
	apt-get -y install build-essential libmotif-dev \
		libjpeg62-turbo-dev libpng12-dev x11proto-print-dev \
		libxmu-headers libxpm-dev libxmu-dev git

RUN git clone https://github.com/alandipert/ncsa-mosaic && \
	cd ncsa-mosaic && \
	make linux

FROM debian:8

RUN apt-get update && \
	apt-get install -y libmotif4 libjpeg62-turbo libpng12-0 libxpm4 libxmu6 && \
	rm -rf /var/cache/apt/* /var/lib/apt/lists/*

COPY --from=build /ncsa-mosaic/src/Mosaic /Mosaic

ENTRYPOINT /Mosaic
