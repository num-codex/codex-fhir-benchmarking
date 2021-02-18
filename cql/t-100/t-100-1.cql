library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem snomed: 'http://snomed.info/sct'
codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'
codesystem SampleMaterialType: 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
codesystem ops: 'http://fhir.de/CodeSystem/dimdi/ops'

context Patient

define Geschlecht:
  Patient.gender = 'female'

define "Diagnose Brustkrebs":
  exists [Condition: Code 'C50.0' from icd10] or
  exists [Condition: Code 'C50.1' from icd10] or
  exists [Condition: Code 'C50.2' from icd10] or
  exists [Condition: Code 'C50.3' from icd10] or
  exists [Condition: Code 'C50.4' from icd10] or
  exists [Condition: Code 'C50.5' from icd10] or
  exists [Condition: Code 'C50.6' from icd10] or
  exists [Condition: Code 'C50.7' from icd10]

define "Bioprobe":
  exists from [Specimen: Code 'Tumor' from SampleMaterialType] S
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
        Code 'C50.7' from icd10
        }

define InInitialPopulation:
  Geschlecht
