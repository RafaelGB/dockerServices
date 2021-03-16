from mlucken/jenkins-arm
# Evitar interacciones en las instalacciones
ENV DEBIAN_FRONTEND=noninteractive

USER root

# Intalacción core de software
RUN apt-get update && \
	apt-get install -y software-properties-common && \
	add-apt-repository -y ppa:deadsnakes/ppa

RUN apt-get install -y python3-distutils && \
	apt-get install -y python3.8

RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python3 get-pip.py

# Instalación de liberías de python
RUN pip install -U ansible

# Otorgamos usuario jenkins por defecto
USER jenkins
