#!/bin/bash

mvn --settings settings.xml deploy:deploy-file -Dfile="$libFolder"/presales-toolbox.jar	        -DartifactId=presales.toolbox -Dpackaging=jar -Dversion="$pslibVersion"  -DgroupId="$groupIdPsLibs" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$libFolder"/adminpermissionsutil-1.0.jar	-DartifactId=adminpermissionsutil -Dpackaging=jar -Dversion="$pslibVersion"  -DgroupId="$groupIdPsLibs" -DrepositoryId="$repoId" -Durl="$repoUrl"
