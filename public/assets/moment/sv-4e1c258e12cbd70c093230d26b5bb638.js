!function(e,a){"object"==typeof exports&&"undefined"!=typeof module?a(require("../moment")):"function"==typeof define&&define.amd?define(["moment"],a):a(e.moment)}(this,function(e){"use strict";var a=e.defineLocale("sv",{months:"januari_februari_mars_april_maj_juni_juli_augusti_september_oktober_november_december".split("_"),monthsShort:"jan_feb_mar_apr_maj_jun_jul_aug_sep_okt_nov_dec".split("_"),weekdays:"s\xf6ndag_m\xe5ndag_tisdag_onsdag_torsdag_fredag_l\xf6rdag".split("_"),weekdaysShort:"s\xf6n_m\xe5n_tis_ons_tor_fre_l\xf6r".split("_"),weekdaysMin:"s\xf6_m\xe5_ti_on_to_fr_l\xf6".split("_"),longDateFormat:{LT:"HH:mm",LTS:"LT:ss",L:"YYYY-MM-DD",LL:"D MMMM YYYY",LLL:"D MMMM YYYY LT",LLLL:"dddd D MMMM YYYY LT"},calendar:{sameDay:"[Idag] LT",nextDay:"[Imorgon] LT",lastDay:"[Ig\xe5r] LT",nextWeek:"dddd LT",lastWeek:"[F\xf6rra] dddd[en] LT",sameElse:"L"},relativeTime:{future:"om %s",past:"f\xf6r %s sedan",s:"n\xe5gra sekunder",m:"en minut",mm:"%d minuter",h:"en timme",hh:"%d timmar",d:"en dag",dd:"%d dagar",M:"en m\xe5nad",MM:"%d m\xe5nader",y:"ett \xe5r",yy:"%d \xe5r"},ordinalParse:/\d{1,2}(e|a)/,ordinal:function(e){var a=e%10,n=1===~~(e%100/10)?"e":1===a?"a":2===a?"a":"e";return e+n},week:{dow:1,doy:4}});return a});