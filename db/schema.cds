namespace adagency;

using { cuid,managed,Country} from '@sap/cds/common';
entity Preferences:cuid
{
key ID: UUID  @odata.Type:'Edm.String' @title : '{i18n>Preference Id}' @Core.Computed;
preferenceType:String @title : '{i18n>Preference Type}'; 
preferenceCost:String  @title : '{i18n>Preference Cost}';
desc: String
}

entity ContentDetails:cuid
{
key ID: UUID  @odata.Type:'Edm.String' @title : '{i18n>Content Id}' @Core.Computed;
contentType:String @title : '{i18n>Content Type}';
contentSize: Integer @title : '{i18n>Content Size (in word/in mb)}';
contentCost: Double@title : '{i18n>Content Cost(per word/per mb)}';
desc: String

}

entity PaymentPlan:cuid
{
key ID:UUID   @odata.Type:'Edm.String' @title : '{i18n>Plan Id}' @Core.Computed;
   content: association to ContentDetails;
   preferences: association to Preferences;
   startDate: Date @title : '{i18n>Start Date}';
   endDate: Date @title : '{i18n>End Date}';
   Country : Country;


}
