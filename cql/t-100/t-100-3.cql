library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem loinc: 'http://loinc.org'
codesystem snomed: 'http://snomed.info/sct'

context Patient

define Geschlecht:
  Patient.gender = 'female'

define "Laborwert Covid Positiv":
  exists(from [Observation: Code '94500-6' from loinc] O
    where O.value.coding contains Code 'positiv' from snomed
    and FHIRHelpers.ToDateTime(O.effective as dateTime) between @2020-03-01 and @2020-12-01)

define "Laborwert Hemoglobin":
  exists(from [Observation: Code '718-7' from loinc] O
    where (O.value as Quantity) < 10 'g/dl' or (O.value as Quantity) > 20 'g/dl')

define InInitialPopulation:
  Geschlecht and "Laborwert Covid Positiv" and "Laborwert Hemoglobin"
