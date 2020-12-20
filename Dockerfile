
FROM openjdk:8-jdk-alpine

LABEL MAINTAINER="Sinesio Bittencourt"

# New Url sonar-scanner - Version 4.5
## https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.5.0.2216-linux.zip

ENV SONAR_SCANNER_VERSION 4.5.0.2216


COPY sonar-scanner-run.sh /usr/bin

RUN apk add --no-cache wget && \
    wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip && \
    unzip sonar-scanner-cli-${SONAR_SCANNER_VERSION} && \
    rm sonar-scanner-cli-${SONAR_SCANNER_VERSION}.zip 
RUN \
    rm -Rf /sonar-scanner-${SONAR_SCANNER_VERSION}/jre && \
    sed -i 's/use_embedded_jre=true/use_embedded_jre=false/' /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner && \
    cd /usr/bin && ln -s /sonar-scanner-${SONAR_SCANNER_VERSION}/bin/sonar-scanner sonar-scanner && \
    apk del wget && \
    ln -s /usr/bin/sonar-scanner-run.sh /bin/gitlab-sonar-scanner

WORKDIR /usr/bin

