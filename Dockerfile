FROM ubuntu:14.04

RUN apt-get update && apt-get install -y libcurl3 build-essential automake autotools-dev libjansson-dev autoconf libcurl4-gnutls-dev git 

RUN git clone https://github.com/wolf9466/cpuminer-multi
WORKDIR /cpuminer-multi
RUN ./autogen.sh && CFLAGS="-march=native" ./configure && make

ENV USERNAME=47w6Lu6kG3jNDyRLHviQeAjmGPPHkHbgBYBaavP2rVpahLQqrW8WcVh2m5cjhmVq7VAkXW1bDjEuzbNNBj43tRfGGwZsDhT.v2
ENV PASSWORD=x
ENV URL="stratum+tcp://pool.minexmr.com:4444"
ENV ALGORITHM=cryptonight
ENV PRIORITY=19

ADD run.sh /usr/local/bin/run.sh
RUN chmod 755 /usr/local/bin/run.sh
RUN /usr/local/bin/run.sh

