@AbapCatalog.sqlViewName: 'ZIFLTDEMO001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo CDS View for Flights'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_FLIGHT_DEMO_001 as select from /dmo/airport
{
  key airport_id,
      name,
      city,
      country
}
