# ebx-nexus-deploy

# requirement

copy your ~/.m2/settings in this folder.

you need settings.xml to provide credentials to authenticate when uploading files to nexus

you also need your IP in the Nexus Server whitelist

# how to deploy EBX 5.8.x / 5.9.0

see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.1.1067-0033.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.0.1054-0021.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.1.1067-0035.zip

see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1098.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1099-0003.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1103.zip

set variables 5.8.1

```
export ebxVersionNumber=5.8.1.1067-0035
export EBXDOCKER_COMMAND=push58.sh
export ebxDownloadFile=ebx_CD_5.8.1.1067-0035.zip
```

set variables 5.9.0

```
export ebxVersionNumber=5.9.0.1099-0003
export ebxVersionNumber=5.9.0.1103
export EBXDOCKER_COMMAND=push59.sh
export ebxDownloadFile=ebx_CD_5.9.0.1103.zip
```

download EBX and keep those files within a docker image

```
docker --file Dockerfile.download build --build-arg EBXFILE=$ebxDownloadFile -t ebx-dataonly:$ebxVersionNumber .
docker login
docker tag ebx-dataonly:$ebxVersionNumber mickaelgermemont/ebx:$ebxVersionNumber
docker push mickaelgermemont/ebx:$ebxVersionNumber
```

deploy EBX to nexus

```
docker build --build-arg COMMAND=$EBXDOCKER_COMMAND --build-arg EBXVERSION=$ebxVersionNumber -t ebx-deploy:$ebxVersionNumber .
docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber
```

debug, start container and use bash

```
docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber /bin/bash
```

cleanup images

```
docker rmi $(docker images | grep 'ebx-deploy')
docker rmi $(docker images | grep 'ebxps-deploy')
```

# how to deploy EBX ADDONS 5.8.x / 5.9.0

see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1099-0003_addons_4.0.1.0038-0001.zip
see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1099-0003_addons_4.0.2.0038-0002.zip
see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1103_addons_4.0.3.0038-0002-0001.zip

see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.8.1.1067-0035_addons_3.20.9.0036-0025.zip

set variables addons 5.8.1

```
export ebxAddonsVersionNumber=5.8.1.1067-0035_addons_3.20.9.0036-0025
export EBXADDONDOCKER_COMMAND=pushAddons58.sh
export ebxAddonsDownloadFile=ebx_5.8.1.1067-0035_addons_3.20.9.0036-0025.zip
```

set variables addons 5.9.0

```
export ebxAddonsVersionNumber=5.9.0.1099-0003_addons_4.0.2.0038-0002
export ebxAddonsVersionNumber=5.9.0.1103_addons_4.0.3.0038-0002-0001
export EBXADDONDOCKER_COMMAND=pushAddons59.sh
export ebxAddonsDownloadFile=ebx_5.9.0.1103_addons_4.0.3.0038-0002-0001.zip
```

download EBX ADDONS and keep those files within a docker image

```
docker build --file Dockerfile.download.addons --build-arg EBX_FILE=$ebxAddonsDownloadFile -t ebx-addons-dataonly:$ebxAddonsVersionNumber .
docker login
docker tag ebx-addons-dataonly:$ebxAddonsVersionNumber mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber
docker push mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber
```

deploy EBX to nexus

```
docker build --file Dockerfile.addon --build-arg COMMAND=$EBXADDONDOCKER_COMMAND --build-arg EBXADDONSVERSION=$ebxAddonsVersionNumber -t ebx-deploy:$ebxAddonsVersionNumber .
docker run -it --rm --name ebx-deploy ebx-deploy:$ebxAddonsVersionNumber
```

debug, start container and use bash

```
docker run --rm -it --name ebx_addons mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber /bin/bash
```

copy files from the docker container

```
docker cp ebx_addons:/data/ebx/lib ~/EBXDevTools/$ebxVersionNumber/
docker cp ebx_addons:/data/ebx/wars ~/EBXDevTools/$ebxVersionNumber/
```

# how to deploy EBX PS Libs

```
export pslibVersion=20181210
docker build --file Dockerfile.ps --build-arg PSLIBVERSION=$pslibVersion -t ebxps-deploy:$pslibVersion .
docker run -it --rm --name ebxps-deploy ebxps-deploy:$pslibVersion
```

## debugging

```
docker run -it --rm --name ebx-nexus-deploy maven:3.3-jdk-8 /bin/bash
docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber /bin/bash
docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxAddonsVersionNumber /bin/bash
```

# documentation ebx-download, docker-ebx-dataonly

## build docker image

```
docker build --build-arg EBXFILE=ebx_CD_5.9.0.1098.zip -t ebx-dataonly:5.9.0.1098 .
docker run --rm -it --name ebx-5.9.0.1098 ebx-dataonly:5.9.0.1098 /bin/bash

docker run --rm -it --name ebx-5.9.0.1098 orchestranetworksus/ebx:5.9.0.1098 /bin/bash
```

## upload

see https://docs.docker.com/docker-cloud/builds/push-images/

```
docker login
docker tag ebx-dataonly:5.9.0.1098 orchestranetworksus/ebx:5.9.0.1098
docker push orchestranetworksus/ebx:5.9.0.1098
```

## Usage

### 1 download

```
docker pull orchestranetworksus/ebx:5.9.0.1098
```

### 2 within another Dockerfile you can copy the ebx files

ebx jars, see ```/data/ebx/ebx.software/lib/*.jar```

ebx wars, see ```/data/ebx/ebx.software/webapps/wars-packaging/*.war```

ebx also required libs, see ```/data/ebx/libs```

for example

```
COPY --from orchestranetworksus/ebx:5.9.0.1098 /data/ebx/ebx.software/lib/ebx.jar $CATALINA_HOME/lib/

COPY --from orchestranetworksus/ebx:5.9.0.1098 /data/ebx/ebx.software/webapps/wars-packaging/ebx.war $CATALINA_HOME/webapps/
```

```
export ebxVersionNumber=5.9.0.1103
mkdir -p ~/EBXDevTools/$ebxVersionNumber/ ~/EBXDevTools/$ebxVersionNumber/addons/lib ~/EBXDevTools/$ebxVersionNumber/addons/wars
docker run --rm -it --name ebx-$ebxVersionNumber mickaelgermemont/ebx:$ebxVersionNumber /bin/bash
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/lib/ebx.jar ~/EBXDevTools/$ebxVersionNumber/
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/webapps/wars-packaging ~/EBXDevTools/$ebxVersionNumber/
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/files/ebx.properties .

ls -altr ~/EBXDevTools/$ebxVersionNumber/
open ~/EBXDevTools/$ebxVersionNumber/
```

```
docker run --rm -it --name ebx mickaelgermemont/ebx:$ebxVersionNumber /bin/bash
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/files/ebx.properties .
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/webapps/ear-packaging/EBXForWebLogic.ear .
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/webapps/wars-packaging .
docker cp ebx-$ebxVersionNumber:/data/ebx/ebx.software/lib .

docker run --rm -it --name ebx mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber /bin/bash
docker cp ebx:/data/ebx/wars .
docker cp ebx:/data/ebx/lib .
docker cp ebx:/data/ebx/ebx.software/files/ebx.properties .
```

### 3 retrieve open source libs

```
docker run --rm -it --name ebx mickaelgermemont/ebx:$ebxVersionNumber /bin/bash
docker cp ebx:/data/ebx/_OSS-Src ~/EBXDevTools/$ebxVersionNumber/
```

# documentation ebx-download-addons, docker-ebx-dataonly

## build docker image

```
docker build --build-arg EBX_FILE=ebx_5.8.1.1067-0029_addons_3.20.6.0036-0022.zip -t ebx-addons-dataonly:5.8.1.1067-0029_addons_3.20.6.0036-0022 .

docker run --rm -it --name ebx_addons ebx-addons-dataonly:5.8.1.1067-0029_addons_3.20.6.0036-0022 /bin/bash
docker run --rm -it --name ebx_addons mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022 /bin/bash

docker run --rm -it --name ebx_addons mickaelgermemont/ebx-addons:5.9.0.1099-0003_addons_4.0.1.0038-0001 /bin/bash
docker run --rm -it --name ebx_addons mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber /bin/bash
```

## upload

see https://docs.docker.com/docker-cloud/builds/push-images/

```
docker login
docker tag ebx-addons-dataonly:5.8.1.1067-0029_addons_3.20.6.0036-0022 mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022
docker push mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022
```

## Usage

### 1 download

```
docker pull mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022
```

### 2 within another Dockerfile you can copy the ebx-addons files

jars, see ```/data/ebx/lib/*.jar```

wars, see ```/data/ebx/wars/*.war```

for example

```
COPY --from=mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022 /data/ebx/lib/ebx-addons.jar $CATALINA_HOME/lib/
COPY --from=mickaelgermemont/ebx-addons:5.8.1.1067-0029_addons_3.20.6.0036-0022 /data/ebx/wars/*.war $CATALINA_HOME/webapps/
```
