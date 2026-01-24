@EndUserText.label: 'Flight booking overview'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_Flight_Ovw_001
  as select from /DMO/R_Booking_D  as b
    inner join /DMO/I_Connection   as cn
      on  cn.AirlineID    = b.AirlineID
      and cn.ConnectionID = b.ConnectionID
    inner join /DMO/I_Airport      as aFrom
      on  aFrom.AirportID = cn.DepartureAirport
    inner join /DMO/I_Airport      as aTo
      on  aTo.AirportID   = cn.DestinationAirport
{
  key b.BookingUUID,
      b.BookingID,
      b.BookingDate,
      b.BookingStatus,
      b.AirlineID,
      b.ConnectionID,
      b.FlightDate,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      b.FlightPrice      as FlightPrice,
      b.CurrencyCode     as CurrencyCode,

      aFrom.AirportID    as FromAirportID,
      aFrom.Name         as FromAirportName,
      aTo.AirportID      as ToAirportID,
      aTo.Name           as ToAirportName
}
