FROM ubuntu
LABEL MAINTAINER="huangzulin"

RUN apt-get update && apt-get install curl unzip wget -y
RUN wget -O rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip \ 
    && unzip rclone.zip -d . \ 
    && mv rclone-*-linux-*/rclone /usr/bin \
    && rm rclone-*-linux-* -rf
    && rm rclone.zip 

COPY aria2 /root/.aria2
COPY init.sh /root/init.sh
RUN apt-get install aria2 -y
RUN wget -O ariang.zip --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4-AllInOne.zip \
    && unzip ariang.zip -d . \ 
    && rm ariang.zip
RUN curl https://getcaddy.com | bash -s personal
RUN chmod +x /root/init.sh

VOLUME ["/root/.aria2", "/root/.config/rclone"]
EXPOSE 2015 6800
ENTRYPOINT [ "/root/init.sh" ]



