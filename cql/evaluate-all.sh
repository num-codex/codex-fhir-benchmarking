#!/usr/bin/env bash

BASE=http://localhost:8080/fhir

echo "T1 - Geschlecht"
./evaluate-measure.sh -f t-1/t-1-1.cql ${BASE}

echo "T1 - Geschlecht + Diagnose"
./evaluate-measure.sh -f t-1/t-1-2.cql ${BASE}

echo "T1 - Geschlecht + Diagnose + Labortest"
./evaluate-measure.sh -f t-1/t-1-3.cql ${BASE}

echo "T1 - Geschlecht + Diagnose + Labortest + Therapie/Medikation"
./evaluate-measure.sh -f t-1/t-1-4.cql ${BASE}
