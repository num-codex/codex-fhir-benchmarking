# this sets up the project
if [ ! "$(docker network ls | grep fhir-benchmark)" ]; then
docker network create fhir-benchmark
fi