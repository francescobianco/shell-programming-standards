FROM fedora:38

RUN dnf -y update && dnf -y install zsh && dnf clean all

ENV SHELL=/bin/zsh
ENV SHELL_NAME=zsh

RUN zsh --version | head -n 1 | sed -ne 's/[^0-9]*\(\([0-9]\.\)\{0,4\}[0-9][^.]\).*/\1/p' > /SHELL_VERSION

CMD ["/bin/zsh"]
