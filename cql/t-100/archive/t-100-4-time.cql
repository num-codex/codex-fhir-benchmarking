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

define Group1:
  Geschlecht
  and "Diagnose Brustkrebs" 

define "Laborwert Covid Positiv":
  from [Observation: Code '94500-6' from loinc] O
    where O.value.coding contains Code 'positiv' from snomed
       and FHIRHelpers.ToDateTime(O.effective as dateTime) between @2020-03-01 and @2020-12-01
    return FHIRHelpers.ToDateTime(O.effective as dateTime)

define Group2:
  "Laborwert Covid Positiv"

define "Laborwert Hemoglobin":
  from [Observation: Code '718-7' from loinc] O
    where not ((O.value as Quantity) between 10 'g/dl' and 20 'g/dl')
    return FHIRHelpers.ToDateTime(O.effective as dateTime)

define Group3:
  "Laborwert Hemoglobin"

define InInitialPopulation:
  Group1 
  and Abs(difference in months between Min(Group2) and Min(Group3)) < 1