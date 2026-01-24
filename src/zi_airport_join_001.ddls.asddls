@AbapCatalog.sqlViewName: 'ZIAIRJ01'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Airport with country name'
@Metadata.ignorePropagatedAnnotations: true
define view ZI_AIRPORT_JOIN_001 
    as select from /dmo/airport as ap
        inner join I_CountryText as ct
            on ct.Country = ap.country
            and ct.Language = $session.system_language
{
    key ap.airport_id,
    ap.name,
    ap.city,
    ap.country      as CountryCode,
    ct.CountryName  as CountryName    
}
