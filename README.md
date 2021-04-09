Mosaic
======

Run from Docker Hub with e.g.

```
podman run -it -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -e DISPLAY=:0 docker.io/mwa4/mosaic
```

Build yourself and run using:

```
podman build -t mosaic:latest .
podman run -it -v /tmp/.X11-unix/X0:/tmp/.X11-unix/X0 -e DISPLAY=:0 mosaic
```
