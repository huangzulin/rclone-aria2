mkdir /config

drive_id=$(openssl rand -hex 8)

cat <<EOF >/config/rclone.conf
[Onedrive]
type = onedrive
token = <token json from rclone authorize>
drive_id = $drive_id
drive_type = personal
EOF

docker run -d --name rclone-aria2 -v /config:/config -p 2015:2015 -p 6800:6800 huangzulin/rclone-aria2

test downloading: https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png