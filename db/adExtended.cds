using {adagency as a1} from './data-model';
//using {AdDetailService} from '../srv/adDetail-service';
using {country as c} from '../srv/external/country';


extend a1.AdDetails with {
    // abc : String;
    adCountry1 : Association to CountryText
                     on ($self.adCountry = adCountry1.Country
                     and $self.adLanguage = adCountry1.Language);

};


entity CountryText as projection on c.A_CountryText {
    *
// key Country,
// CountryName as countryName,
// Language as language
};
