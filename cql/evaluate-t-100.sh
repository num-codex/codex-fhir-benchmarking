#!/usr/bin/env bash

BASE=http://localhost:8080/fhir

echo "T100 - Geschlecht"
./evaluate-measure.sh -f t-100/t-100-1.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv"
./evaluate-measure.sh -f t-100/t-100-2.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (ohne Zeit)"
./evaluate-measure.sh -f t-100/t-100-3.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (mit Zeit)"
./evaluate-measure.sh -f t-100/t-100-3-time.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (ohne Zeit) + Diagnose Brustkrebs"
./evaluate-measure.sh -f t-100/t-100-4.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (mit Zeit) + Diagnose Brustkrebs"
./evaluate-measure.sh -f t-100/t-100-4-time.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (ohne Zeit) + Diagnose Brustkrebs + Bioprobe"
./evaluate-measure.sh -f t-100/t-100-5.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (mit Zeit) + Diagnose Brustkrebs + Bioprobe"
./evaluate-measure.sh -f t-100/t-100-5-time.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (ohne Zeit) + Diagnose Brustkrebs + Bioprobe + Prozedur Bluttransfusion (ohne Zeit)"
./evaluate-measure.sh -f t-100/t-100-6.cql ${BASE}

echo "T100 - Geschlecht + Laborwert Covid Positiv + Laborwert Hemoglobin (mit Zeit) + Diagnose Brustkrebs + Bioprobe + Prozedur Bluttransfusion (mit Zeit)"
./evaluate-measure.sh -f t-100/t-100-6-time.cql ${BASE}
