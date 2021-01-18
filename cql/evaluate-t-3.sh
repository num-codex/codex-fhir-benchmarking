#!/usr/bin/env bash

BASE=http://localhost:8080/fhir

echo "T3 - Diagnose"
./evaluate-measure.sh -f t-3/t-3-1.cql ${BASE}

echo "T3 - Diagnose + Procedure"
./evaluate-measure.sh -f t-3/t-3-2.cql ${BASE}

echo "T3 - Diagnose + Procedure + Specimen"
./evaluate-measure.sh -f t-3/t-3-3.cql ${BASE}
