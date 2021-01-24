FROM debian:buster-slim

RUN useradd -ms /bin/bash app && \
  apt-get update && \
  apt-get install -y gnupg1 apt-transport-https dirmngr && \
  export INSTALL_KEY=379CE192D401AB61 && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys $INSTALL_KEY && \
  echo "deb https://ookla.bintray.com/debian generic main" | tee /etc/apt/sources.list.d/speedtest.list

RUN apt-get update && apt-get install -y speedtest

USER app

CMD [ "speedtest", "--accept-license", "--accept-gdpr" ]
