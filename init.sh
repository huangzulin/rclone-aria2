#!/bin/bash

chmod +x /root/.aria2/autoupload.sh

chmod +x /root/.aria2/delete.aria2.sh

chmod +x /root/.aria2/delete.sh

echo > /root/.aria2/aria2.session

aria2c --conf-path=/root/.aria2/aria2.conf & caddy