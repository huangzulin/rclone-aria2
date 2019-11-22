FROM ubuntu
LABEL MAINTAINER="huangzulin"

RUN apt-get update && apt-get install curl unzip wget -y
RUN curl https://rclone.org/install.sh | bash
COPY aria2 ./.aria2
COPY init.sh init.sh
RUN apt-get install aria2 -y
RUN wget -O ariang.zip --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4-AllInOne.zip && unzip ariang.zip -d . && rm -rf ariang.zip
RUN curl https://getcaddy.com | bash -s personal

VOLUME ["/root/.aria2", "/root/.config/rclone"]
EXPOSE 2015 6800
CMD [ "./init.sh" ]



