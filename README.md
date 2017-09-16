# What is XMRig-NVIDIA?

XMRig-NVIDIA is the console miner provided by [XMRig](https://github.com/xmrig/xmrig-nvidia).

XMRig-NVIDIA supports Cryptonight, and Cryptonight-lite.

# How to use this image [NVIDIA version]

Run in background:

```console
$ docker run -d --device /dev/nvidia0:/dev/nvidia0 --device /dev/nvidiactl:/dev/nvidiactl --device /dev/nvidia-uvm:/dev/nvidia-uvm --device /dev/nvidia-modeset:/dev/nvidia-modeset --name YOUR_CONTAINER_NAME calvintam236/xmrig-nvidia:nvidia -a YOUR_ALGO -o YOUR_POOL_ADDRESS -u YOUR_USERNAME.YOUR_WORKER_NAME -p YOUR_WORKER_PASSWORD --donate-level=1
```

Get `xmrig` options with:

```console
$ docker run --rm calvintam236/xmrig-nvidia:nvidia
```

Fetch logs of a container:

```console
$ docker logs YOUR_CONTAINER_NAME
```
