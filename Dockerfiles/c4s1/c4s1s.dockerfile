FROM ubuntu:20.10

# old releases
RUN sed -i -e 's/archive.ubuntu.com\|security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# instalar openssh server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# crear usuario test con pass test
RUN useradd -m test && echo "test:test" | chpasswd
RUN mkdir /var/run/sshd
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config

EXPOSE 22

# Ejecuta bash al iniciar el contenedor
CMD ["/bin/bash"]
