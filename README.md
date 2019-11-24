

## 使用ariang作为aria2的web UI，下载完成后通过rclone同步到远程。

1. 下载rclone [https://rclone.org/downloads](https://rclone.org/downloads) 

2. 创建onedrive类型的 rclone.conf,远程名称为`remote`，你不应该改变它。文件放在 `$HOME\.config\rclone\rclone.conf`
```powershell
rclone config
```
3. 运行docker容器，rclone.conf通过文件夹挂载。
```bash
docker run -d --name rclone-aria2 -v /config:/config -v /data:/root/Download -p 2015:2015 -p 6800:6800 huangzulin/rclone-aria2
```

4. 下载一些东西来测试一下吧：
```
https://www.baidu.com/img/bd_logo1.png
```
---
## use ariang as aria2 web UI,after downloded
1. download rclone [https://rclone.org/downloads](https://rclone.org/downloads)  
2. create a type onedrive rclone.conf,remote name is `remote`,you should not change it. file stroe at `$HOME\.config\rclone\rclone.conf`
```powershell
rclone config
```
3. run docker container, rclone.conf should be mount in the directory.   
```bash
docker run -d --name rclone-aria2 -v /config:/config -v /data:/root/Download -p 2015:2015 -p 6800:6800 huangzulin/rclone-aria2
```
4. download some thing for test:   
```
https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png
```