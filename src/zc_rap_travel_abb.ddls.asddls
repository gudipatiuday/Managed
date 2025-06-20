@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel BO Projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity zc_rap_travel_abb
  as projection on ZI_RAP_Travel_ABB
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Consumption.valueHelpDefinition: [{ entity:{ name:'/DMO/I_AGENCY', element: 'AgencyID' } }]
      @ObjectModel.text.element: [ 'AgencyName' ]
      @Search.defaultSearchElement: true
      AgencyID,
      _Agency.Name as AgencyName,
      @Consumption.valueHelpDefinition: [{ entity:{ name:'/DMO/I_CUSTOMER', element: 'CustomerID' } }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.LastName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      @Consumption.valueHelpDefinition: [{ entity:{ name: 'I_Currency', element: 'Currency'} }]
      CurrencyCode,
      Description,
      TravelStatus,
      LastChangedAt,
      LocalLastChangedAt,
      /* Associations */
      _Agency,
      _Booking : redirected to composition child zc_rap_booking_abb,
      _Currency,
      _Customer
}
