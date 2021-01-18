#!/usr/bin/env bash

BASE=http://localhost:8080/fhir

echo "T2 - Alter"
./evaluate-measure.sh -f t-2/t-2-1.cql ${BASE}

echo "T2 - Alter + Diagnose"
./evaluate-measure.sh -f t-2/t-2-2.cql ${BASE}

echo "T2 - Alter + Diagnose + Biomaterial"
./evaluate-measure.sh -f t-2/t-2-3.cql ${BASE}

echo "T2 - Alter + Diagnose + Biomaterial + Medikation"
./evaluate-measure.sh -f t-2/t-2-4.cql ${BASE}
