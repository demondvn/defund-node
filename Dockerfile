FROM ubuntu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y wget curl make clang pkg-config libssl-dev build-essential git jq ncdu bsdmainutils htop
# WORKDIR /defund
COPY defund.sh defund.sh
RUN chmod +x defund.sh
RUN apt install sudo -y
RUN echo -e "MonPham\n" | /bin/bash defund.sh

# VOLUME ~/.defund/
EXPOSE 26656
ENTRYPOINT ["defundd", "start"] 