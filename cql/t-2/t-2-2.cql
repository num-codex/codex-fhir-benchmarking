library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem icd10: 'http://fhir.de/CodeSystem/dimdi/icd-10-gm'

context Patient

define InInitialPopulation:
  AgeInYears() > 65 and
  exists
  	(from
  		([Condition: Code 'I10.00' from icd10] union
       [Condition: Code 'I10.01' from icd10] union
   	 	 [Condition: Code 'I10.10' from icd10] union
   	 	 [Condition: Code 'I10.11' from icd10] union
   	 	 [Condition: Code 'I10.90' from icd10] union
   	 	 [Condition: Code 'I10.91' from icd10]) C
   	 where FHIRHelpers.ToDateTime(C.onset) between @2020-01-01 and @2020-04-30)
