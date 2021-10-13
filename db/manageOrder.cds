namespace adagency;

using {cuid, managed, Country} from '@sap/cds/common';

entity ManageOrder : cuid, managed {
    key ID          : UUID @odata.Type : 'Edm.String';
        planID      : String;
        description : LargeString;
        address     : LargeString;
        country     :Country;
        totalAmount : Double;
        status      : OrderStatus;      
}

type OrderStatus : String enum{
    Confirmed;Pending;
}

entity MyOrderStatus{
    key code: String;
}
