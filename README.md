# ebx-nexus-deploy

# requirement

copy your ~/.m2/settings in this folder. you need settings.xml to provide credentials to authenticate when uploading files to nexus

# commands for EBX 5.8.x

see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.1.1067-0033.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.0.1054-0021.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.8.1.1067-0035.zip

```
$ export ebxVersionNumber=5.8.1.1067-0035
$ cd ../docker-ebx-dataonly/
$ docker build --build-arg EBXFILE=ebx_CD_5.8.1.1067-0035.zip -t ebx-dataonly:$ebxVersionNumber .
$ docker login
$ docker tag ebx-dataonly:$ebxVersionNumber mickaelgermemont/ebx:$ebxVersionNumber
$ docker push mickaelgermemont/ebx:$ebxVersionNumber

$ cd ../ebx-nexus-deploy
$ docker build --build-arg COMMAND=push58.sh --build-arg EBXVERSION=$ebxVersionNumber -t ebx-deploy:$ebxVersionNumber .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber
```

# commands for EBX 5.9.0

see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1098.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1099-0003.zip
see https://dl.orchestranetworks.com/restricted/download/ebx_CD_5.9.0.1103.zip

```
$ export ebxVersionNumber=5.9.0.1103

$ cd ../docker-ebx-dataonly/
$ docker build --build-arg EBXFILE=ebx_CD_$ebxVersionNumber.zip -t ebx-dataonly:$ebxVersionNumber .
$ docker login
$ docker tag ebx-dataonly:$ebxVersionNumber mickaelgermemont/ebx:$ebxVersionNumber
$ docker push mickaelgermemont/ebx:$ebxVersionNumber

$ cd ../ebx-nexus-deploy
$ docker build --build-arg COMMAND=push59.sh --build-arg EBXVERSION=$ebxVersionNumber -t ebx-deploy:$ebxVersionNumber .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber

$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber /bin/bash

```

# commands for EBX ADDONS

see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1099-0003_addons_4.0.1.0038-0001.zip
see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1099-0003_addons_4.0.2.0038-0002.zip
see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.9.0.1103_addons_4.0.3.0038-0002-0001.zip

see https://dl.orchestranetworks.com/restricted/download/addons/ebx_5.8.1.1067-0035_addons_3.20.9.0036-0025.zip

```
$ export ebxAddonsVersionNumber=5.8.1.1067-0035_addons_3.20.9.0036-0025
$ export EBXADDONDOCKER_COMMAND=pushAddons58.sh
$ cd ../docker-ebx-addons-dataonly/
$ docker build --build-arg EBX_FILE=ebx_5.8.1.1067-0035_addons_3.20.9.0036-0025.zip -t ebx-addons-dataonly:$ebxAddonsVersionNumber .

$ export ebxAddonsVersionNumber=5.9.0.1103_addons_4.0.3.0038-0002-0001
$ export EBXADDONDOCKER_COMMAND=pushAddons59.sh
$ cd ../docker-ebx-addons-dataonly/
$ docker build --build-arg EBX_FILE=ebx_5.9.0.1103_addons_4.0.3.0038-0002-0001.zip -t ebx-addons-dataonly:$ebxAddonsVersionNumber .

$ docker login
$ docker tag ebx-addons-dataonly:$ebxAddonsVersionNumber mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber
$ docker push mickaelgermemont/ebx-addons:$ebxAddonsVersionNumber
```

```
$ cd ../ebx-nexus-deploy
$ docker build --file Dockerfile.addon --build-arg COMMAND=$EBXADDONDOCKER_COMMAND --build-arg EBXADDONSVERSION=$ebxAddonsVersionNumber -t ebx-deploy:$ebxAddonsVersionNumber .
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxAddonsVersionNumber
```

# commands for EBX PS Libs

```
$ cd ../ebx-nexus-deploy
$ export pslibVersion=20181210
$ docker build --file Dockerfile.ps --build-arg PSLIBVERSION=$pslibVersion -t ebxps-deploy:$pslibVersion .
$ docker run -it --rm --name ebxps_deploy ebxps-deploy:$pslibVersion
```

## debugging

```
$ docker run -it --rm --name ebx-nexus-deploy maven:3.3-jdk-8 /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxVersionNumber /bin/bash
$ docker run -it --rm --name ebx-nexus-deploy ebx-deploy:$ebxAddonsVersionNumber /bin/bash
```
