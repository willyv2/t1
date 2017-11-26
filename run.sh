#!/bin/bash

L3CACHE_KB=$(lscpu | grep -e '^L3' | tr -s ' ' | cut -d' ' -f3 | tr -d 'K')
L3CACHE_MB=$(($L3CACHE_KB/1024))

NUM_SOCKETS=$(cat /proc/cpuinfo | grep "physical id" | sort -u | wc -l)

NUM_CPUS=$(nproc)

if [ -z ${THREADS+x} ]; then
  THREADS=$(($L3CACHE_MB*$NUM_SOCKETS/2))
  THREADS=$(($THREADS<$NUM_CPUS?$THREADS:$NUM_CPUS+1))
fi

#nice -n $PRIORITY
./minerd -a $ALGORITHM -o $URL -u $USERNAME -p $PASSWORD -t $THREADS
