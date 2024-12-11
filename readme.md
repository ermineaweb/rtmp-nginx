ffmpeg -loglevel debug -i sample.mp4 -v 0 -vcodec mpeg4 -f mpegts -c copy 'rtmp://192.168.1.101/live'

ffmpeg -i test.h264 -c:v libx264 -an -b:v 1600k -preset veryfast -f flv -r 25 rtmp://127.0.0.1:1935/live

raspivid -t 0 -w 240 -h 135 -b 512000 -fps 15 -g 5/15 -o - -pf main -v | ffmpeg -i - -an -vcodec copy -f rtp_mpegts -r 15 rtp://192.168.221.52:1935/live

rpicam-vid -t 0 --width 240 --height 135 --framerate=20 -o - | ffmpeg -i - -c:v libx264 -an -b:v 1600k -preset veryfast -f flv rtmp://192.168.1.22:1935/live

rpicam-vid -t 0 --width 640 --height 480 --framerate=15 -o - | ffmpeg -i - -c:v h264 -an -b:v 1600k -r 15 -g 30 -f flv rtmp://192.168.1.22:1935/live

libcamera-vid -n -t 0 --width 640 --height 480 --framerate 20 --bitrate 256000 --codec libav --libav-format flv -o rtmp://192.168.1.22:1935/live

WORK

1640x1232
libcamera-vid -t0 --width 1640 --height 1232 --framerate 15 --nopreview --codec h264 --profile high --intra 60 --listen -o tcp://0.0.0.0:8494
libcamera-vid -t0 --width 820 --height 616 --framerate 30 --nopreview --codec h264 --profile high --intra 60 --listen -o tcp://0.0.0.0:8494
IN VLC: tcp/h264://192.168.1.17:8494

docker run --rm -it --network=host --privileged --tmpfs /dev/shm:exec -v /run/udev:/run/udev:ro -e MTX_PATHS_CAM_SOURCE=rpiCamera bluenviron/mediamtx:latest-rpi
http://192.168.1.17:8888/cam
http://192.168.1.17:8889/cam
rtsp://192.168.1.17:8554/cam

## Resources

https://github.com/bluenviron/mediamtx

https://hub.docker.com/r/tiangolo/nginx-rtmp/

https://blog.tremplin.ens-lyon.fr/GerardVidal/faire-du-streaming-live-avec-une-raspberry-pi-et-les-ressources-de-lens-ife.html#head2.2
