@AbapCatalog.sqlViewName: 'ZIAIRPCN01'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airports by country'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_AIRPORT_BY_CN
    with parameters p_country : land1
as select from /dmo/airport
{
  key airport_id,
      name,
      city,
      country
}
where country = :p_country
