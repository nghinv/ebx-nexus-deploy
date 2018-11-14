# ebx-nexus-deploy

# requirement

copy your ~/.m2/settings in this folder. you need settings.xml to provide credentials to authenticate when uploading files to nexus

# commands

```
$ docker build --build-arg EBXVERSION=5.8.1.1067-0029 -t ebx-deploy:5.8.1.1067-0029 .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029
```

## debugging

```
$ docker run -it --rm --name ebx-nexus-deploy maven:3.3-jdk-8 /bin/bash

$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:5.8.1.1067-0029 /bin/bash
```
