# rpi-fluent-bit

Fluent Bit (<http://fluentbit.io/>) build for Raspberry PI and potentially other ARM devices.

## Alternatives

I'm planning to use this container as a sidecar providing logging capabilities. However, fluent-bit is being distributed as the td-agent-bit package multiple Linux distributions please see: <http://fluentbit.io/documentation/0.13/installation/td-agent-bit.html>.

### 

## How to use

The docker container can be executed as follows (This is a simple example priting CPU into to stdout):

```bash
docker run mscatdk/rpi-fluent-bit:latest
```

The fluent-bit configuration file is located in /root/config/fluent-bit.conf and can be replaced to obtain a different configuration as follows:

```bash
docker run -v $(pwd)/fluent-bit.conf:/root/config/fluent-bit.conf mscatdk/rpi-fluent-bit:latest
```

## Build process

The build process is outligned here: <http://fluentbit.io/documentation/0.13/installation/build_install.html> 

```bash
git clone git@github.com:mscatdk/rpi-fluent-bit.git
cd rpi-fluent-bit

docker build . -t mscatdk/rpi-fluent-bit:latest
```

## Test

The docker image has been tested on the following devices:

* Raspberry Pi 1 Model B
* Raspberry PI 3 Model B
