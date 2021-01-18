library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'
codesystem ops: 'http://fhir.de/CodeSystem/dimdi/ops'

context Patient

define InInitialPopulation:
	exists ([Condition: Code 'C50.0' from idc10]) and
  exists ([Procedure: Code '5-*' from ops]) and
	exists (from [Specimen] S
  	where
    	exists(
      	from S.extension E
        	where E.url = 'https://fhir.bbmri.de/StructureDefinition/SampleDiagnosis' and
          			E.value.coding contains Code 'C50.0' from idc10
      )
    )
