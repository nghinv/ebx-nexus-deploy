# ebx-nexus-deploy

# requirement

copy your ~/.m2/settings in this folder. you need settings.xml to provide credentials to authenticate when uploading files to nexus

# commands for EBX

```
$ docker build --build-arg EBXVERSION=5.8.1.1067-0029 -t ebx-deploy:5.8.1.1067-0029 .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029
```

# commands for EBX ADDONS

```
$ docker build --file Dockerfile.addon --build-arg EBXADDONSVERSION=5.8.1.1067-0029_addons_3.20.6.0036-0022 -t ebx-deploy:5.8.1.1067-0029_addons_3.20.6.0036-0022 .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029_addons_3.20.6.0036-0022
```

## debugging

```
$ docker run -it --rm --name ebx-nexus-deploy maven:3.3-jdk-8 /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029 /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029_addons_3.20.6.0036-0022 /bin/bash
```
