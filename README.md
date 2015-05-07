# docker-stellarium

Browse the cosmos and control your telescope with [Stellarium](http://www.stellarium.org/en_CA/) running under Docker.

## Building the image

Clone this repository, change into the source directory and run:

```
docker build .
```

## Running Stellarium

To start Stellarium do:

```
docker run -it \
   -e DISPLAY=$DISPLAY \
   -v /dev/shm:/dev/shm \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v $HOME/.stellarium:/root/.stellarium \
   --device /dev/dri/card0 \
   --name stellarium \
   jamesnetherton/stellarium
```

To use the [telescope control plugin](http://www.stellarium.org/wiki/index.php/Telescope_Control_plug-in), you'll need to add a `--device` flag pointing at your RS232 port (usually `/dev/ttyS0`) or your USB->RS232 adapter (usually `/dev/ttyUSB0`).

When the application has launched, you'll be able to configure the telescope control plugin as per usual and point it at `/dev/ttyS0` or `/dev/ttyUSB0`.

```
docker run -it \
   -e DISPLAY=$DISPLAY \
   -v /dev/shm:/dev/shm \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v $HOME/.stellarium:/root/.stellarium \
   --device /dev/dri/card0 \
   --device /dev/ttyUSB0 \
   --name stellarium \
   jamesnetherton/stellarium
```

### Command line options

You can pass any of the usual [command line options](http://www.stellarium.org/wiki/index.php/Advanced_Use#Command_Line_Options) to stellarium by adding them onto the end of `docker run`. E.g to disable full screen mode on startup:

```
docker run -it \
   -e DISPLAY=$DISPLAY \
   -v /dev/shm:/dev/shm \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   -v $HOME/.stellarium:/root/.stellarium \
   --device /dev/dri/card0 \
   --device /dev/ttyUSB0 \
   --name stellarium \
   jamesnetherton/stellarium --full-screen no
```
