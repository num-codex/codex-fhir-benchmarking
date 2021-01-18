library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'

context Patient

define InInitialPopulation:
	exists ([Condition: Code 'C50.0' from idc10])
