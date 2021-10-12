namespace adagency;

using {
    cuid,
    //Country
} from '@sap/cds/common';

entity AdDetails : cuid {
    key ID             : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        userID         : String;
        title          : String;
        textContent    : LargeString;
       // country        : Country;
        category       : Association to Category;
        graphicContent : Association to many GraphicContent
                             on graphicContent.addetails = $self;
}

entity Category {
    key ID   : UUID @odata.Type : 'Edm.String'  @Core.Computed;
        name : String;
}

entity GraphicContent {
    key ID        : UUID        @odata.Type       : 'Edm.String'  @Core.Computed;
        imageType : String      @Core.IsMediaType : true;
        image     : LargeBinary @Core.MediaType   : imageType  @Core.ContentDisposition.Filename : fileName;
        fileName  : String;
        addetails : Association to AdDetails;
}