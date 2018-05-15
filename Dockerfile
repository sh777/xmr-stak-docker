FROM ubuntu:xenial

RUN apt-get update && apt install -y -qq curl git cmake g++ libmicrohttpd-dev libssl-dev libhwloc-dev

RUN git clone https://github.com/fireice-uk/xmr-stak.git

RUN curl -OL https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run

RUN chmod a+x cuda_*_linux-run 

RUN ./cuda_9.0.176_384.81_linux-run  --silent --toolkit 

RUN cd xmr-stak

RUN cmake -DCUDA_ENABLE=ON -DOpenCL_ENABLE=OFF .

RUN make

ENTRYPOINT ["bin/.xmr-stak"]
CMD ["--currency haven -o stratum+tcp://xhv.mineallcrypto.com:6046 -u hvxy82aJc7NXMPMmA1Vv5N8DX2ykjpAgtWcXd794FjJXPX37xJHZWcXDbN1BN5wR9RivYG8sNBW1XJrGAZJarDji3ZTiarMePm -p x"]