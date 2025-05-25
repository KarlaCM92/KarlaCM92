******************** poverty (own measures)  ************************************

*estimations of population living in poverty based on labor income reported in Censuses

*** directories
*root
global root "C:\Users\tino_\Dropbox"

*original census data
global original "$root\la bestia\migration_census\Original"

*where to save poverty estimations
global poverty "$root\la bestia\poverty own estimations"


*********** 2000 ************************************

** Local variable for each state
local n 01 02 03 04 05 06 07 08 09 10 11 12 13 14 ///
        15 16 17 18 19 20 21 22 23 24 25 26 27 ///
		28 29 30 31 32

foreach i of local n {
*load data
use "$original\census_2000\PER_F`i'.dta", clear
*keep relevant variables
*note that for 2000 we have home ind, but for 2010 onwards this is not available
*that is why we aggregate at house level (NUMVIV) and not at  home level (NUMHOG)
keep ENT MUN NUMVIV NUMHOG FACTOR INGRESOS EDAD
destring INGRESOS, replace
destring EDAD, replace
destring FACTOR, replace

*drop not specified age or income
drop if INGRESOS==999999  | EDAD==999

*number of members of a house
bysort ENT MUN NUMVIV: gen hsize=_N
*house income
bysort ENT MUN NUMVIV: egen hincome=sum(INGRESOS)

*aggregate data to house level
*collapse (mean) FACTOR hsize hincome, by(ENT MUN NUMVIV)

*estimate daily income(USD) 
*we use PPP from: https://data.oecd.org/conversion/purchasing-power-parities-ppp.htm
gen hincomeusd=(hincome/6.103027)/30.4 //average number of days in a month
lab var hincomeusd "Daily household income per day  in USD (PPP)"

*gen poverty line
gen pline=hsize*5.5 // 5.5 USD poverty line per person

*verify whether the members of a house are poor
gen poverty=.
replace poverty=1 if hincomeusd<pline
replace poverty=0 if hincomeusd>=pline

*aggregate by municipality
collapse (mean) poverty [aw=FACTOR], by(ENT MUN)
lab var poverty "percentage of population living in poverty (own measure)"

*save 
save "$poverty\2000\\`i'.dta", replace
}
.
clear
forvalues i=1/9{
append using "$poverty\2000\0`i'.dta"
}
.
forvalues i=10/32{
append using "$poverty\2000\\`i'.dta"
}
.
*save
gen year=2000
save "$poverty\poverty2000.dta", replace


*********** 2010 ************************************

** Local variable for each state
local n 01 02 03 04 05 06 07 08 09 10 11 12 13 14 ///
        15 16 17 18 19 20 21 22 23 24 25 26 27 ///
		28 29 30 31 32

foreach i of local n {
*load data
use "$original\census_2010\personas_`i'.dta", clear
*keep relevant variables
keep ent mun id_viv numper edad ingtrmen factor
renvars ent mun id_viv numper edad ingtrmen factor \ ENT MUN NUMVIV NUMPER EDAD INGRESOS FACTOR

*drop not specified age or income
drop if INGRESOS==999999  | EDAD==999

*number of members of a house
bysort ENT MUN NUMVIV: gen hsize=_N
*house income
bysort ENT MUN NUMVIV: egen hincome=sum(INGRESOS)

*aggregate data to house level
*collapse (mean) FACTOR hsize hincome, by(ENT MUN NUMVIV)

*estimate daily income(USD) 
*we use PPP from: https://data.oecd.org/conversion/purchasing-power-parities-ppp.htm
gen hincomeusd=(hincome/7.676843)/30.4 //average number of days in a month
lab var hincomeusd "daily total home income in USD (PPP)"

*gen poverty line
gen pline=hsize*5.5 // 5.5 USD poverty line per person

*compute whether the members of a house are poor
gen poverty=.
replace poverty=1 if hincomeusd<pline
replace poverty=0 if hincomeusd>=pline

*aggregate by municipality
collapse (mean) poverty [aw=FACTOR], by(ENT MUN)
lab var poverty "percentage of population living in poverty (own measure)"

*save 
save "$poverty\2010\\`i'.dta", replace
}
.
clear
forvalues i=1/9{
append using "$poverty\2010\0`i'.dta"
}
.
forvalues i=10/32{
append using "$poverty\2010\\`i'.dta"
}
.
*save
gen year=2010
save "$poverty\poverty2010.dta", replace

*********** 2015 ************************************

** Local variable for each state
local n 01 02 03 04 05 06 07 08 09 10 11 12 13 14 ///
        15 16 17 18 19 20 21 22 23 24 25 26 27 ///
		28 29 30 31 32

foreach i of local n {
*load data
use "$original\survey_2015\Tr_persona`i'.dta", clear
*keep relevant variables
keep id_viv id_persona ent mun factor numper edad ingtrmen

renvars  ent mun id_viv numper edad ingtrmen factor \ ENT MUN NUMVIV NUMPER EDAD INGRESOS FACTOR

*drop not specified age or income
drop if INGRESOS==999999  | EDAD==999

*number of members of a house
bysort ENT MUN NUMVIV: gen hsize=_N
*house income
bysort ENT MUN NUMVIV: egen hincome=sum(INGRESOS)

*aggregate data to house level
*collapse (mean) FACTOR hsize hincome, by(ENT MUN NUMVIV)

*estimate daily income(USD) 
*we use PPP from: https://data.oecd.org/conversion/purchasing-power-parities-ppp.htm
gen hincomeusd=(hincome/8.327595)/30.4 //average number of days in a month
lab var hincomeusd "daily total home income in USD (PPP)"

*gen poverty line
gen pline=hsize*5.5 // 5.5 USD poverty line per person

*compute whether the members of a house are poor
gen poverty=.
replace poverty=1 if hincomeusd<pline
replace poverty=0 if hincomeusd>=pline

*aggregate by municipality
collapse (mean) poverty [aw=FACTOR], by(ENT MUN)
lab var poverty "percentage of population living in poverty (own measure)"

*save 
save "$poverty\2015\\`i'.dta", replace
}
.
clear
forvalues i=1/9{
append using "$poverty\2015\0`i'.dta"
}
.
forvalues i=10/32{
append using "$poverty\2015\\`i'.dta"
}
.
*save
gen year=2015
save "$poverty\poverty2015.dta", replace

*********** 2020 ************************************

** Local variable for each state
local n 01 02 03 04 05 06 07 08 09 10 11 12 13 14 ///
        15 16 17 18 19 20 21 22 23 24 25 26 27 ///
		28 29 30 31 32

foreach i of local n {
*load data
use "$original\census_2020\Personas`i'.dta", clear
*keep relevant variables
keep ent mun id_viv id_persona factor numper edad ingtrmen
*sort ent mun id_viv numper

renvars ent mun id_viv numper edad ingtrmen factor \ ENT MUN NUMVIV NUMPER EDAD INGRESOS FACTOR

*drop not specified age or income
drop if INGRESOS==999999  | EDAD==999

*number of members of a house
bysort ENT MUN NUMVIV: gen hsize=_N
*house income
bysort ENT MUN NUMVIV: egen hincome=sum(INGRESOS)

*aggregate data to house level
*collapse (mean) FACTOR hsize hincome, by(ENT MUN NUMVIV)

*estimate daily income(USD) 
*we use PPP from: https://data.oecd.org/conversion/purchasing-power-parities-ppp.htm
gen hincomeusd=(hincome/9.522285)/30.4 //average number of days in a month
lab var hincomeusd "daily total home income in USD (PPP)"

*gen poverty line
gen pline=hsize*5.5 // 5.5 USD poverty line per person

*compute whether the members of a house are poor
gen poverty=.
replace poverty=1 if hincomeusd<pline
replace poverty=0 if hincomeusd>=pline

*aggregate by municipality
collapse (mean) poverty [aw=FACTOR], by(ENT MUN)
lab var poverty "percentage of population living in poverty (own measure)"

*save 
save "$poverty\2020\\`i'.dta", replace
}
.
clear
forvalues i=1/9{
append using "$poverty\2020\0`i'.dta"
}
.
forvalues i=10/32{
append using "$poverty\2020\\`i'.dta"
}
.
*save
gen year=2020
save "$poverty\poverty2020.dta", replace

************ append all years ***********************
clear
local years "2000 2010 2015 2020"
foreach i of local years{
append using "$poverty\poverty`i'.dta"
}
.
*format the variables
gen munid=ENT+MUN
destring munid, replace
order munid, first
keep munid year poverty
order munid year poverty
sort munid year
replace poverty=100*poverty
tab year, miss //a year's observations increase due to new municipalities
*save
save "$poverty\poverty2000_2010_2015_2020.dta", replace


