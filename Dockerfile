FROM ubuntu:16.10

RUN apt-get update && apt-get install -y sudo
RUN useradd brydon --create-home --groups sudo
RUN echo "brydon ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers

USER brydon

CMD /bin/bash