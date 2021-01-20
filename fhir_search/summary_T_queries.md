# Summary T-Gen Queries

## Allgemein

- **Tabelle nicht vollständig. Wird nochmals überarbeitet**

## Testaufgabe 1

### Blaze

| Anfrage                                                                                                                                                                                                                                                               | Aufgabe                | Server | Ergebnis | Kommentar                          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------ | -------- | ---------------------------------- |
| http://localhost:8080/fhir/Patient?gender=female&_summary=count                                                                                                                                                                                                       | T1 Patient             | Blaze  | 65170    | OK                                 |
| http://localhost:8080/fhir/Condition?code=C71.0,C71.1,C71.2,C71.3,C71.4,C71.4,C71.5&_summary=count                                                                                                                                                                    | T1 Condition           | Blaze  | 2383     | Sollte 2052 sein (tbd)             |
| http://localhost:8080/fhir/Observation?code=26515-7&value-quantity=le50&value-quantity=ge30&_summary=count                                                                                                                                                            | T1 Observation         | Blaze  | 10295    | OK                                 |
| http://localhost:8080/fhir/MedicationStatement?medication.code=L01AX03&_summary=count                                                                                                                                                                                 | T1 MedicationStatement | Blaze  | 194      | Kein Forward Chainning             |
| http://localhost:8080/fhir/Patient?_has:Condition:subject:code=C71.0,C71.1,C71.2,C71.3,C71.4,C71.4,C71.5&_has:Observation:subject:code=26515-7&_has:Observation:subject:value-quantity=le50&_has:Observation:subject:value-quantity=ge30&gender=female&_summary=count | T1 Kompakt             | Blaze  | 4        | Kein \_has für MedicationStatement |

### Hapi

| Anfrage                                                                                                                                                                                                                                                               | Aufgabe                | Server | Ergebnis | Kommentar                          |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------ | -------- | ---------------------------------- |
| http://localhost:8082/fhir/Patient?gender=female&_summary=count                                                                                                                                                                                                       | T1 Patient             | Hapi   | 65170    | OK                                 |
| http://localhost:8082/fhir/Condition?code=C71.0,C71.1,C71.2,C71.3,C71.4,C71.4,C71.5&_summary=count                                                                                                                                                                    | T1 Conditiion          | Hapi   | 2052     | OK                                 |
| http://localhost:8082/fhir/Observation?code=26515-7&value-quantity=le50&value-quantity=ge30&_summary=count                                                                                                                                                            | T1 Observation         | Hapi   | 10295    | OK                                 |
| http://localhost:8082/fhir/MedicationStatement?medication.code=L01AX03&_summary=count                                                                                                                                                                                 | T1 MedicationStatement | Hapi   | 194      | OK                                 |
| http://localhost:8082/fhir/Patient?_has:Condition:subject:code=C71.0,C71.1,C71.2,C71.3,C71.4,C71.4,C71.5&_has:Observation:subject:code=26515-7&_has:Observation:subject:value-quantity=le50&_has:Observation:subject:value-quantity=ge30&gender=female&_summary=count | T1 Kompakt             | Hapi   | 4        | Kein \_has für MedicationStatement |

### IBM

todo

## Testaufgabe 2

### Blaze

| Anfrage                                                                                                                                                                                                                                | Aufgabe                | Server | Ergebnis | Kommentar                                                               |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------ | -------- | ----------------------------------------------------------------------- |
| http://localhost:8080/fhir/Patient?birthdate=le1953&_summary=count                                                                                                                                                                     | T1 Patient             | Blaze  | 41300    | OK                                                                      |
| http://localhost:8080/fhir/Condition?code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&onset-date=ge2020-01-01&onset-date=le2020-04-30&_summary=count                                                                                     | T1 Condition           | Blaze  | 5429     | OK                                                                      |
| http://localhost:8080/fhir/Specimen?type=Serum&_summary=count                                                                                                                                                                          | T1 Specimen            | Blaze  | 0        | todo (remove cellection-8 from blueprint)                               |
| http://localhost:8080/fhir/MedicationStatement?medication.code=L01AX03&_summary=count                                                                                                                                                  | T1 MedicationStatement | Blaze  | 4100     | Kein Forward Chainning                                                  |
| http://localhost:8080/fhir/Patient?_has:Condition:subject:code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&_has:Condition:subject:onset-date=ge2020-01-01&_has:Condition:subject:onset-date=le2020-04-30&birthdate=le1953&_summary=count | T1 Kompakt             | Blaze  | 3079     | Kein \_has für MedicationStatement und Specimen fehlt (bis jetzt) in DB |

### Hapi

| Anfrage                                                                                                                                                                                                                                                                 | Aufgabe                | Server | Ergebnis | Kommentar                                                                                                                             |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------- | ------ | -------- | ------------------------------------------------------------------------------------------------------------------------------------- |
| http://localhost:8082/fhir/Patient?birthdate=le1953&_summary=count                                                                                                                                                                                                      | T1 Patient             | Hapi   | 41300    | OK                                                                                                                                    |
| http://localhost:8082/fhir/Condition?code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&onset-date=ge2020-01-01&onset-date=le2020-04-30&_summary=count                                                                                                                      | T1 Condition           | Hapi   | 5429     | OK                                                                                                                                    |
| http://localhost:8082/fhir/Specimen?type=Serum&_summary=count                                                                                                                                                                                                           | T1 Specimen            | Hapi   | 0        | todo (remove cellection-8 from blueprint)                                                                                             |
| http://localhost:8082/fhir/MedicationStatement?medication.code=L01AX03&_summary=count                                                                                                                                                                                   | T1 MedicationStatement | Hapi   | 4100     | todo (fehler bei Datengenerierung, falscher Code)                                                                                     |
| http://localhost:8082/fhir/Patient?_has:Condition:subject:code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&_has:Condition:subject:onset-date=ge2020-01-01&_has:Condition:subject:onset-date=le2020-04-30&_has:Specimen:subject:type=Serum&birthdate=le1953&_summary=count | T1 Kompakt             | Hapi   | 0        | Kombination von zwei Condition:subject:onset-date nicht möglich ("No explicit selection and an implicit one could not be determined") |
| http://localhost:8082/fhir/Patient?_has:Condition:subject:code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&_has:Condition:subject:onset-date=le2020-04-30&_has:Specimen:subject:type=Serum&birthdate=le1953&_summary=count                                                | T1 Kompakt Teil 1      | Hapi   | 1000     | beide kompakte Teile sind 1000, weil Specimen=Serum beide die Selbe Anzahl haben                                                      |
| http://localhost:8082/fhir/Patient?_has:Condition:subject:code=I10.00,I10.01,I10.10,I10.11,I10.90,I10.91&_has:Condition:subject:onset-date=ge2020-01-01&_has:Specimen:subject:type=Serum&birthdate=le1953&_summary=count                                                | T1 Kompakt Teil 2      | Hapi   | 1000     | beide kompakte Teile sind 1000, weil Specimen=Serum beide die Selbe Anzahl haben                                                      |

### IBM

todo

## Testaufgabe 3

### Blaze

| Anfrage                                                                                                             | Aufgabe      | Server | Ergebnis | Kommentar                                 |
| ------------------------------------------------------------------------------------------------------------------- | ------------ | ------ | -------- | ----------------------------------------- |
| http://localhost:8080/fhir/Condition?code=C50.0&_summary=count                                                      | T1 Patient   | Blaze  | 7300     | OK                                        |
| http://localhost:8080/fhir/Procedure?code=5-*&_summary=count                                                        | T1 Procedure | Blaze  | 258386   | OK                                        |
| http://localhost:8080/fhir/Specimen?type=Tumor&_summary=count                                                       | T1 Specimen  | Blaze  | 0        | todo (remove cellection-8 from blueprint) |
| http://localhost:8080/fhir/Patient?_has:Condition:subject:code=C50.0&_has:Procedure:subject:code=5-*&_summary=count | T1 Kompakt   | Blaze  | 1998     | todo (Specimen fehlt (bis jetzt) in DB)   |

### Hapi

| Anfrage                                                                                                                                              | Aufgabe      | Server | Ergebnis | Kommentar |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ | ------ | -------- | --------- |
| http://localhost:8082/fhir/Condition?code=C50.0&_summary=count                                                                                       | T1 Patient   | Hapi   | 7300     | OK        |
| http://localhost:8082/fhir/Procedure?code=5-*&_summary=count                                                                                         | T1 Procedure | Hapi   | 258386   | OK        |
| http://localhost:8082/fhir/Specimen?type=Tumor&_summary=count                                                                                        | T1 Specimen  | Hapi   | 100000   | OK        |
| http://localhost:8082/fhir/Patient?_has:Condition:subject:code=C50.0&_has:Procedure:subject:code=5-*&_has:Specimen:subject:type=Tumor&_summary=count | T1 Kompakt   | Hapi   | 500      | OK        |

### IBM

todo


