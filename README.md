# ebx-nexus-deploy

# requirement

copy your ~/.m2/settings in this folder. you need settings.xml to provide credentials to authenticate when uploading files to nexus

# commands for EBX

see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.1.1067-0033.zip

```
$ export ebxVersionNumber=5.8.1.1067-0033
$ cd ../docker-ebx-dataonly/
$ docker build --build-arg EBXFILE=ebx_CD_5.8.1.1067-0033.zip -t ebx-dataonly:$ebxVersionNumber .
$ docker login
$ docker tag ebx-dataonly:$ebxVersionNumber mickaelgermemont/ebx:$ebxVersionNumber
$ docker push mickaelgermemont/ebx:$ebxVersionNumber

$ cd ../ebx-nexus-deploy
$ docker build --build-arg EBXVERSION=$ebxVersionNumber -t ebx-deploy:$ebxVersionNumber .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber

```

# commands for EBX ADDONS

see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1098_addons_4.0.0.0038.zip

```
$ export ebxAddonsVersionNumber=5.8.1.1067-0029_addons_3.20.6.0036-0022
$ docker build --file Dockerfile.addon --build-arg EBXADDONSVERSION=$ebxAddonsVersionNumber -t ebx-deploy:$ebxAddonsVersionNumber .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxAddonsVersionNumber
```

## debugging

```
$ docker run -it --rm --name ebx-nexus-deploy maven:3.3-jdk-8 /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxAddonsVersionNumber /bin/bash
```
