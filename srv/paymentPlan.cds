//using from './adagency-paymentplan';
using from './adagency-service';
using from '@sap/cds/common';

annotate AdAgencyServices.PaymentPlanDetails with @odata.draft.enabled;
annotate AdAgencyServices.PaymentPlanDetails with @( 


UI:{
     SelectionFields: [preferences_ID,content_ID],
    LineItem:[
        {Value: cType},
        {Value: cSize},
        {Value: cCost},
        {Value: pType},
        {Value: pCost},
        {Value: startDate},
        {Value: endDate},

    ],
    HeaderInfo:{
        TypeName: '{i18n>paymentPlan}',
        TypeNamePlural: '{i18n>Plans}',
      //  Title: {Value: title},
        //Description: {Value:},
        Title:{Value:ID}


        
        
    },


         Facets: [
            {$Type: 'UI.ReferenceFacet', Label: '{i18n>Plan Details}', Target: '@UI.FieldGroup#General'},
        
        ],
        FieldGroup#General: {
            Data: [
                //{Value: ID, Label:'{i18n>Book ID}'},
                {Value: preferences_ID, Label:'{i18n>Preferences}'},
                {Value: content_ID,Label:'{i18n>Contents}'},
               // {Value:cType},
               // {Value:cSize},
               // {Value:cCost},
                {Value:startDate},
                {Value:endDate}
            ]
        },
        

        
},    

);

annotate AdAgencyServices.PaymentPlanDetails with {  
    content @(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'contentDetails',
            Label           : 'PaymentPlan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterOut',
                    LocalDataProperty : 'content_ID',
                    ValueListProperty : 'ID',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentType'
                },  
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentSize'
                },   
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'contentCost'
                },  
            ]
        }
    });

    
}

annotate AdAgencyServices.PaymentPlanDetails with {
     pType@(Common : {
        FieldControl : #Mandatory,
        ValueList    : {
            CollectionPath  : 'preferences',
            Label           : 'Payment Plan',
            //SearchSupported : true,
            Parameters      : [
                {
                    $Type             : 'Common.ValueListParameterInOut',
                    LocalDataProperty : 'pType',
                    ValueListProperty : 'preferenceType',
                },
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceType'
                },  
                {
                    $Type             : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'preferenceCost'
                },   
               
            ]
        }
    });
}