Build a custom using docker image
---------------------------------
*Using a docker container with required utilities to build a custom kernel*

Command line example
--------------------
* `/tmp`: build output directory, need about 5GB as of July 2, 2023
* `/path/to/src/linux`: linux source code with .git
```
docker run -it --rm --user 1000:1000 -v /tmp:/tmp -v /home/vagrant/src/linux:/opt/src/linux neofob/kernel-builder:22.04
time build_kernel.sh
```

Docker compose form
-------------------
```
# check config
docker-compose config

# compile new kernel
time docker-compose up
```
