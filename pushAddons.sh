#!/bin/bash

mvn --settings settings.xml deploy:deploy-file -Dfile="$libFolder"/ebx-addons.jar	-Djavadoc="$libFolder"/ebx-addons-javadoc.jar	-DartifactId=ebx.api.addon -Dpackaging=jar -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-adix.war													-DartifactId=ebx-addon-adix -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-common.war												-DartifactId=ebx-addon-common -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-dama.war													-DartifactId=ebx-addon-dama -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-daqa.war													-DartifactId=ebx-addon-daqa -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
#mvn --settings settings.xml deploy:deploy-file -Dfile="$addonWarFolder"/ebx-addon-dmdv.war													-DartifactId=ebx-addon-dmdv -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-dqid.war													-DartifactId=ebx-addon-dqid -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-gram.war													-DartifactId=ebx-addon-gram -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-hmfh.war													-DartifactId=ebx-addon-hmfh -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-igov.war													-DartifactId=ebx-addon-igov -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-moda.war													-DartifactId=ebx-addon-moda -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-mtrn.war													-DartifactId=ebx-addon-mtrn -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-rpfl.war													-DartifactId=ebx-addon-rpfl -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
mvn --settings settings.xml deploy:deploy-file -Dfile="$warFolder"/ebx-addon-tese.war													-DartifactId=ebx-addon-tese -Dpackaging=war -Dversion="$addonVersion"  -DgroupId="$groupId" -DrepositoryId="$repoId" -Durl="$repoUrl"
