#!/bin/bash
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxLibFolder/ebx.jar -Djavadoc=$ebxLibFolder/ebx-javadoc.jar -DartifactId=ebx.api.core -Dpackaging=jar -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx.war -DartifactId=ebx -Dpackaging=war -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx-root-1.0.war -DartifactId=ebx-root-1.0 -Dpackaging=war -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx-manager.war -DartifactId=ebx-manager -Dpackaging=war -Dversion=$ebxVersion  -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx-dma.war -DartifactId=ebx-dma -Dpackaging=war -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx-dataservices.war -DartifactId=ebx-dataservices -Dpackaging=war -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
mvn --settings settings.xml deploy:deploy-file -Dfile=$ebxWarFolder/ebx-ui.war -DartifactId=ebx-ui -Dpackaging=war -Dversion=$ebxVersion -DgroupId=$groupId -DrepositoryId=$repoId -Durl=$repoUrl
