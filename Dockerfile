FROM alpine
LABEL MAINTAINER="huangzulin"
ENV RCLONE_OPTS="--config /config/rclone.conf"

COPY aria2 /root/.aria2
COPY init.sh /root/init.sh

RUN apk add --no-cache curl unzip wget aria2 \
    && wget -O rclone.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip \ 
    && unzip rclone.zip -d . \ 
    && mv rclone-*-linux-*/rclone /usr/bin \
    && rm rclone-*-linux-* -rf \
    && rm rclone.zip \
    && wget -O ariang.zip --no-check-certificate https://github.com/mayswind/AriaNg/releases/download/1.1.4/AriaNg-1.1.4-AllInOne.zip \
    && unzip ariang.zip -d . \ 
    && rm ariang.zip \
    && curl "https://caddyserver.com/download/linux/amd64?license=personal&telemetry=off" | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod +x /root/init.sh \
    && apk del curl unzip wget

VOLUME ["/root/.aria2", "/config"]]
EXPOSE 2015 6800
ENTRYPOINT [ "/root/init.sh" ]



