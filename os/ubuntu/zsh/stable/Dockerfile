FROM ubuntu:22.04

RUN apt-get update && apt-get -y install zsh && apt-get clean

ENV OS_NAME=ubuntu

ENV SHELL=/bin/zsh
ENV SHELL_NAME=zsh

RUN zsh --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p' > /SHELL_VERSION

CMD ["/bin/zsh"]
