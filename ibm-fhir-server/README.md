# IBM FHIR Server

IBM FHIR Server based on [ibm fhir repository](https://github.com/IBM/FHIR).

Supporting  R4.

## Run

### With batteries included

```sh
docker-compose -f docker-compose.yml up
```

Access at <http://localhost:9080/fhir-server/api/v4>
username: fhiruser
password: change-password

To get a json response use: <http://localhost:9080/fhir-server/api/v4/Observation?_format=json>

## Configure

TODO - add configuration information

