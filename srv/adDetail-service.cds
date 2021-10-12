using adagency as Ad from '../db/data-model';
using {country as c} from './external/country';
//using { country as c } from './external/country.csn';

service AdDetailService {
    @Capabilities : {
        Insertable : true,
        Deletable  : true
    }
    entity AdDetails      as projection on Ad.AdDetails {
        * , category.name as categoryName
    };

    entity Category       as projection on Ad.Category;
    entity GraphicContent as projection on Ad.GraphicContent;
    @readonly
    entity Country        as projection on c.A_Country{
        key Country
    };
    @readonly
    entity CountryText    as projection on c.A_CountryText{
        key Country,
        CountryName as cn,
        Language as l
    };

}
