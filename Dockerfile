ARG EBXVERSION
FROM mickaelgermemont/ebx:${EBXVERSION} as base

FROM maven:3.6-jdk-8
ARG EBXVERSION

RUN mkdir -p /data/ebx /data/ebx/lib /data/ebx/webapps /data/ebx/Java_API
WORKDIR /data/ebx

COPY --from=base /data/ebx/ebx.software/lib/*.jar ./lib/
COPY --from=base /data/ebx/ebx.software/webapps/wars-packaging/*.war ./webapps/
COPY --from=base /data/ebx/ebx.documentation/en/advanced/Java_API ./Java_API/
RUN jar -cvf ./lib/ebx-javadoc.jar ./Java_API/*

ENV groupId=com.orchestranetworks.ebx
ENV groupIdPsLibsCommon=com.orchestranetworks.ebx.ps.common
ENV repoId=mickaelgermemont.repo.releases.admin
ENV repoUrl=http://javastore.mickaelgermemont.com:8081/repository/releases

ENV ebxVersion=${EBXVERSION}
ENV ebxWarFolder=./webapps
ENV ebxLibFolder=./lib

ARG COMMAND

RUN echo ${ebxVersion}
COPY ${COMMAND} push.sh
RUN chmod +x push.sh
COPY settings.xml .

CMD ["/data/ebx/push.sh"]
