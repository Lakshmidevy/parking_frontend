FROM jenkins/jenkins:lts
USER root
RUN apt-get update && \
apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common && \
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
apt-get update && \
apt-get -y install docker-ce
RUN apt-get install -y docker-ce
RUN usermod -a -G docker jenkins
# update
RUN apt-get update
# install curl
RUN apt-get install curl
# get install script and pass it to execute:
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
# and install node
RUN apt-get install nodejs
RUN apt-get install gcc g++ make
RUN npm install -g  create-react-app
