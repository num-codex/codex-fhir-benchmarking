#!/usr/bin/env bash

BASE=http://localhost:8080/fhir

echo "T100 - Geschlecht"
./evaluate-measure.sh -f t-100/t-100-1.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv"
./evaluate-measure.sh -f t-100/t-100-2.cql ${BASE}

#echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin"
#./evaluate-measure.sh -f t-100/t-100-3.cql ${BASE}
