#docker compose --env-file ./ci/env/variables.yml build jenkins-base
#docker compose --env-file ./ci/env/variables.yml build gradle_4-9
docker compose --env-file ./ci/env/variables.yml build scala_2-11-8
docker compose --env-file ./ci/env/variables.yml build scala_2-12-7
docker compose --env-file ./ci/env/variables.yml build scala_2-12-12
docker compose --env-file ./ci/env/variables.yml build scala_2-13-4
#docker compose --env-file ./ci/env/variables.yml build node_6-11-5
#docker compose --env-file ./ci/env/variables.yml build node_9.9.0
#docker compose --env-file ./ci/env/variables.yml build node_12.16.2
#docker compose --env-file ./ci/env/variables.yml build node_15.3.0
#docker compose --env-file ./ci/env/variables.yml build maven_3.2.5
#docker compose --env-file ./ci/env/variables.yml build maven_3.5.4
#docker compose --env-file ./ci/env/variables.yml build maven_3.6.3
echo Python
#docker compose --env-file ./ci/env/variables.yml build python_2.7.15

#got to get past this point
#docker compose --env-file ./ci/env/variables.yml build python_3.6.0
#docker compose --env-file ./ci/env/variables.yml build python_3.6.1
#docker compose --env-file ./ci/env/variables.yml build python_3.8.7
#docker compose --env-file ./ci/env/variables.yml build python_3.9.1
echo SBT

#docker compose --env-file ./ci/env/variables.yml build --build-arg PARENT_VERSION=2.12.7 sbt_0-13-13 
#docker compose --env-file ./ci/env/variables.yml build --build-arg PARENT_VERSION=2.11.8 sbt_1-2-4 
echo JQ
docker compose --env-file ./ci/env/variables.yml build jq_1-6
echo CM
docker compose --env-file ./ci/env/variables.yml build cm_1.0
docker compose --env-file ./ci/env/variables.yml build cm_2.0
