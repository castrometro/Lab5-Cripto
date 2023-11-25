# Usa la imagen base de Ubuntu 16.10
FROM ubuntu:16.10

#oldreleases coretsía de: https://smyl.es/how-to-fix-ubuntudebian-apt-get-404-not-found-package-repository-errors-saucy-raring-quantal-oneiric-natty/
RUN sed -i 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
RUN sed -i 's/security.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list

# Actualizar repositorios e instalar paquetes
RUN apt-get update && apt-get upgrade -y
RUN apt-get install openssh-client openssh-server -y

# Comando para ejecutar al iniciar el contenedor
CMD ["bash"]