library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'

context Patient

define InInitialPopulation:
  Patient.gender = 'female' and
  (exists([Condition: Code 'C71.0' from icd10]) or
   exists([Condition: Code 'C71.1' from icd10]) or
   exists([Condition: Code 'C71.2' from icd10]) or
   exists([Condition: Code 'C71.3' from icd10]) or
   exists([Condition: Code 'C71.4' from icd10]) or
   exists([Condition: Code 'C71.5' from icd10]))
