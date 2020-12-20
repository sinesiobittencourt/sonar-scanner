[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/sinesio.com.br/Sonar%2Fv1?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWYwYmFlYzg1ZDZhMTEwMWUxMTZlNmMw.QwxVWdcTTNmv-mD06sR5EMpw_weBBFE6jChlzqnRy1E)]( https://g.codefresh.io/pipelines/edit/new/builds?id=5fd3985656e3d046be46b63b&pipeline=v1&projects=Sonar&projectId=5fd2b01c2de059825bc8b8af)

# sonarqube

How to use:

GitLab <-> SonarScanner <-> SonarServer

docker run -d --name sonarServer \
-p 9000:9000 -p 9092:9092 \
-v sonarServer_data:/data \
-e SONARQUBE_JDBC_USERNAME=sonar \
-e SONARQUBE_JDBC_PASSWORD=sonar \
sonarqube:latest


>> https://github.com/gabrie-allaigre/sonar-auth-gitlab-plugin

>> https://github.com/gabrie-allaigre/sonar-gitlab-plugin

docker pull sinesiobittencourt/sonar-scanner:4.5

docker run -d -it --name sonarScanner -v sonarScanner_data:/data sinesiobittencourt/sonar-scanner:4.5

http://0.0.0.0:9000



