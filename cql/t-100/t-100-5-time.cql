library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem snomed: 'http://snomed.info/sct'
codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'
codesystem SampleMaterialType: 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'

context Patient

define Geschlecht:
  Patient.gender = 'female'

define "Laborwert Covid Positiv":
  exists from [Observation: Code '94500-6' from loinc] O
    where O.value.coding contains Code 'positiv' from snomed
    and FHIRHelpers.ToDateTime(O.effective as dateTime) between @2020-03-01 and @2020-12-01

define "Laborwert Hemoglobin":
  exists from [Observation: Code '718-7' from loinc] H
    with [Observation: Code '94500-6' from loinc] C
      such that Abs(difference in months between
        FHIRHelpers.ToDateTime(H.effective as dateTime) and
        FHIRHelpers.ToDateTime(C.effective as dateTime)) < 1
    where (H.value as Quantity) < 10 'g/dl' or (H.value as Quantity) > 20 'g/dl'

define "Diagnose Brustkrebs":
  exists [Condition: Code 'C50.0' from icd10] or
  exists [Condition: Code 'C50.1' from icd10] or
  exists [Condition: Code 'C50.2' from icd10] or
  exists [Condition: Code 'C50.3' from icd10] or
  exists [Condition: Code 'C50.4' from icd10] or
  exists [Condition: Code 'C50.5' from icd10] or
  exists [Condition: Code 'C50.6' from icd10] or
  exists [Condition: Code 'C50.8' from icd10] or
  exists [Condition: Code 'C50.9' from icd10]

define "Bioprobe":
  exists from [Specimen: Code 'tumor' from SampleMaterialType] S
    where exists from S.extension E
      where E.url = 'https://fhir.bbmri.de/StructureDefinition/SampleDiagnosis'
      and E.value.coding in {
        Code 'C50.0' from icd10,
        Code 'C50.1' from icd10,
        Code 'C50.2' from icd10,
        Code 'C50.3' from icd10,
        Code 'C50.4' from icd10,
        Code 'C50.5' from icd10,
        Code 'C50.6' from icd10,
        Code 'C50.8' from icd10,
        Code 'C50.9' from icd10}

define InInitialPopulation:
  Geschlecht and
  "Laborwert Covid Positiv" and
  "Laborwert Hemoglobin" and
  "Diagnose Brustkrebs" and
  "Bioprobe"
