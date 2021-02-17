# Summary Feasibility Queries

## Test Task 1

| # | Query |
| - | ------- |
| 1 | Patient?gender=female&_summary=count |
| 2 | Condition?code=C71.0,C71.1,C71.2,C71.3,C71.4,C71.5 |
| 3 | Observation?code=26515-7&value-quantity=le50 |
| 4 | MedicationStatement?medication.code=L01AX03 |
| Compact | Not possible |


## Test Task 2

| # | Query |
| - | ------- |
| 1 | Patient?birthdate=le1953 |
| 2 | Condition?code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&onset-date=ge2020-01-01&onset-date=le2020-04-30 |
| 3 | Observation?code=26515-7&value-quantity=le50 |
| 4 | MedicationStatement?medication.code=L01AX03 |
| Compact | Not possible: Exclusion not possible, Multiple value restriction in query with date not possible |


## Test Task 3

| # | Query |
| - | ------- |
| 1 | Condition?code=C50.0 |
| 2 | Procedure?code=5-* |
| 3 | Specimen?type=Tumor |
| 4 | MedicationStatement?medication.code=L01AX03 |
| Compact | Possible, if Specimen and Condition losely related: Patient?_has:Condition:subject:code=C50.0&_has:Procedure:subject:code=5-* |


## Test Task 100

| # | Query |
| - | ------- |
| 1 | Patient?gender=female |
| 2 | Condition?code=C50.1,C50.2,C50.3,C50.4,C50.5,C50.6,C50.7 |
| 3 | Specimen?type=tumor |
| 4 | Observation?code=94500-6&date=ge2020-03-01&date=le2020-12-01&value-concept=positiv |
| 5 | Observation?code=718-7&value-quantity=le10.0,ge20.0 |
| 6 | Procedure?code=8-80 |
| Compact | Not possible - as time dependencies between resources cannot be resolved |

## Conclusion

The &_has operator of FHIR Search is treated separately and a combination of multiple filters on one resrouce is not possible when using the &_has operator.
This means that when using &_has between value searches are not possbile, further search for a resource within a specified date is also not supported.
