***Step 1: Set path to libraries
*global root "D:\Dropbox\observatorio"
*global all "D:\Dropbox\observatorio\modelo\dta_clean" 
*global result "D:\Dropbox\observatorio\modelo\result"
*global final "D:\Dropbox\observatorio\papers\karla\1. narcofeminicides\6.masterfiles"
*cd "D:\Dropbox\observatorio"


global root "/Users/karlacruz/Dropbox/observatorio"
global result "$root/modelo/result"
global final "$root/papers/karla/1. narcofeminicides/6.masterfiles"
global covar "$root/papers/karla/1. narcofeminicides/4. covariates"
global figure "$root/papers/karla/1. narcofeminicides/5. tables and figs"
cd "$root"

**************************************
**********merge all dataset***********
**************************************
use "$root/Noria/Base-de-datos-MUCD/mucd90_2020.dta",  clear
*Noria w/ execution in period 2007-2010
merge m:1 cvegeo year  using"$root/method/magaloni/magaloni1998_2010.dta", force
drop _merge
*Controles Yunuen
merge m:1 cvegeo year using  "$covar/controles malla/controles municipio/controlesmun.dta", force
drop _merge
*Datset Secretariado Ejecutivo
merge m:1 cvegeo year  using "$root/incidencia_delictiva/final/dta_año_municipio/all_snspyear.dta", force
drop _merge
*distance municipio to oilpipes
merge m:1 cvegeo using "$covar/distancia de municipio a gaseoducto/distance_municipality_OilPipes.dta", force
drop _merge
*confrontation SEDENA and PF. Dataset of PPD-CIDE
merge m:1 cvegeo year  using "$covar/Enfrentamientos/dataset/eventos año municipio/eventosPFcve.dta", force
drop _merge
merge m:1 cvegeo year using "$covar/Enfrentamientos/dataset/eventos año municipio/eventossedenacve.dta", force
drop _merge
*distance border
merge m:m cvegeo using "$covar/distancias municipio/bordercvegeo.dta", force
drop _merge
*distance  port
merge m:m cvegeo using "$covar/distancias municipio/portdistcvegeo.dta", force
drop _merge
rename borderdistcvegeo borderdist 
rename portdist_mun portdist
label var portdist "distance from mun to port"
label var borderdist "distance from mun to border USA"
*price drugs
merge m:1 year using "$covar/price drugs/heroin_price.dta"
drop _merge
merge m:1 year using "$covar/price drugs/fentanyl_prices.dta"
drop _merge
merge m:1 year using "$covar/price drugs/cocaine.dta"
drop _merge
*seizure colombia
merge m:m year using "$covar/Incautaciones colombianas/colombia.dta"
drop _merge
*homicide INEGI
merge m:1 cvegeo year using "$covar/Homicidios/result/homicidios años/homigob_year.dta"
drop _merge
*dataset of ENOE*
merge m:m cvegeo year using "$root/ENOE/dataset/inf_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/unempl_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/menunempl_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/femaleunempl_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/mac_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/inf_gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/for_gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/manu_gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/15_30gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/31_50gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/51gap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/schoolgap_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/meninf_final.dta"
drop _merge
merge m:m cvegeo year using "$root/ENOE/dataset/wominf_final.dta"
drop _merge
label var h_esc "years school men mean "
label var m_esc "years school women mean "
drop h_in m_in pea desocu_bus pob ocu_inf ocu_mac
***************************************
********Data observatory***************
***************************************
**the last definition of coding`s Nayely
merge m:1 cvegeo year using "$root/papers/nay/1. new base of feminicides/4. covariates/Collapse.dta"
drop _merge

drop if cvegeo==. 
drop if cvegeo==2
*gen state 
*gen cvegeo1=cvegeo
*tostring cvegeo1, replace format(%05.0f)
*gen state=ustrleft(cvegeo1,2)
*destring state, replace
*drop cvegeo1
*rates*
global rateOb protocolo penalfederal penal_inj ndfm penal_states intimate infant familiar weapons guns communitary genderor armconflict byconexion
global rateSN femicidesnsp femiwguns femiweapon
 
foreach x of var $rateOb{
gen `x'_r = (`x'/pob_women)*100000
label var `x'_r " `x' rate by Observatory"
}
.
foreach x of var $rateSN{
gen `x'_r = (`x'/pob_women)*100000
label var `x'_r " `x' rate by SNSP"
}
.
*missing*
*replace fentanylprice = fentanylprice[_n-1] if missing(fentanylprice) 
global missing protocolo_r penalfederal_r penal_inj_r ndfm_r penal_states_r intimate_r infant_r familiar_r weapons_r guns_r communitary_r genderor_r armconflict_r byconexion_r femicidesnsp_r femiwguns_r femiweapon_r sedena_1a sedena_1b sedena_2a sedena_2b sedena_3a sedena_3b sedena_4a sedena_4b sedena_5 sedena_6 sedena_7 sedena_8a sedena_8i sedena_9a sedena_9i sedena_10a sedena_10i sedena_11a sedena_11i sedena_12a sedena_12i sedena_13a sedena_14a sedena_15a sedena_16a sedena_16i sedena_17a sedena_17i semar_1 semar_2 semar_3 semar_4 semar_5 semar_6 semar_7 semar_8 semar_9 semar_10 semar_11 semar_12 semar_13 semar_14 pf_1 pf_2 pf_4 pf_5 pf_6 pf_7 pf_8 pf_9 pf_10 pf_11 gn_1 gn_2 gn_4 gn_6 gn_8 gn_9 gn_10 gn_11 gn_12 deaths_total leader_cont_pub lieutenant_cont_pub treat_leader treat_leader_cont treat_lieu treat_lieu_cont aux_control aux_treated aux_neigh lpub_after06 lpub_after612 lpub_after12 lieupub_after06 lieupub_after612 lieupub_after12 lcpub_after06 lcpub_after612 lcpub_after12 lieucpub_after06 lieucpub_after612 lieucpub_after12 sp splcpub_after06 splcpub_after612 splcpub_after12 splieucpub_after06 splieucpub_after612 splieucpub_after12 urban homicide homicide_r nl_mean  births deaths avgsize events_gdelt1 events_gdelt2 hamarijuana hapoppy fields_marijuana hamarijuana_semar cocaine drugdealing confrontationPf injuregob deathgob detention injurecrime deathcrime injurecivi deathcivi pf sedena semar pgr pe pm afi es deathmili injuremili detencrime confrontSEDENA

foreach x of var $missing{
replace  `x' = 0 if `x'==.
}
.
egen noria=rowtotal(sedena_1a sedena_1b sedena_2a sedena_2b sedena_3a sedena_3b sedena_4a sedena_4b sedena_5 sedena_6 sedena_7 sedena_8a sedena_8i sedena_9a sedena_9i sedena_10a sedena_10i sedena_11a sedena_11i sedena_12a sedena_12i sedena_13a sedena_14a sedena_15a sedena_16a sedena_16i sedena_17a sedena_17i semar_1 semar_2 semar_3 semar_4 semar_5 semar_6 semar_7 semar_8 semar_9 semar_10 semar_11 semar_12 semar_13 semar_14 pf_1 pf_2 pf_4 pf_5 pf_6 pf_7 pf_8 pf_9 pf_10 pf_11 gn_1 gn_2 gn_4 gn_6 gn_8 gn_9 gn_10 gn_11 gn_12)
*dummy presence
gen againdrugs=0 if noria==0
replace againdrugs=1 if againdrugs==.
*gen gdlt=1 if events_gdelt1>0 | events_gdelt2>0
*replace gdlt=0 if gdlt==.
*gen calderon=1 if deaths_total>0
*replace calderon=0 if calderon==.
label var againdrugs "=1 if actiones against drugs"
label var noria "actiones against drugs sum"

*label var gdlt "=1 if there are events"
*label var calderon "=1 if there were deaths 2007 until 2010 "
*sd*
*egen mediah= mean(homicide_r)
*egen float desv= sd(homicide_r)
*gen z=(homicide_r-mediah)/(desv)

drop nom_ent nom_mun cruces puertos Country Typical SpecificDrugName 
rename distance d_oilpipe
rename heroin_pkg heroinprice
label var heroinprice "heroin price 2007-2017"
label var cocaineprice "cocaine price 2007-2017"
label var  cocain14_19 "cocaine price max 2014-2019 in USA"
label var fentanylprice "fentanyl price 2011-2013, 2016, 2019"

gen difunempl=menunempl_r - womunempl_r
label var difunempl "difference in unemployment rate between gender"

save "$final/allmun.dta", replace

use "$final/allmun.dta", clear
drop if year<2000
drop if year>2020

sort cvegeo year
*edit cvegeo year againdrugs 

*edit gdelt gdeltmax gdelt1 gdelt1cont group deaths_total deadf1 gdelt confront events_gdelt1 confrontation  if year>1999
*confortation
egen conf1=sum(confrontationPf) if year>=2017, by(cvegeo)
egen conf1cont=sum(confrontationPf) if year>=2000 & year<2017, by(cvegeo)
gen confront=conf1 if year>=2017
replace confront=conf1cont if year>=2000 & year<2017
drop conf1 conf1cont

*gdlt1
egen gdelt1=sum(events_gdelt1) if year>=2017, by(cvegeo)
egen gdelt1cont=sum(events_gdelt1) if year>=2000 & year<2017, by(cvegeo)
gen gdelt=gdelt1 if year>=2017
replace gdelt=gdelt1cont if year>=2000 & year<2017
drop gdelt1 gdelt1cont
egen gdeltmax=max(gdelt) if year>=2000, by(cvegeo)
egen confontmaxallperiod=max(confront) if year>=2000, by(cvegeo)

*gdlt + confrontation
*drop sumgdltconfront
gen sumgdltconfront=gdelt+confront if year>=2017
egen gdlconfmax=max(sumgdltconfront) if year>=2000, by(cvegeo)

gen presumgdltconfront=gdelt+confront if year>=2000 & year<2017
egen premax=max(presumgdltconfront) if year>=2000, by(cvegeo)
*noria data
gen predrugs=sum(againdrugs) if year>=2000 & year<2017
egen premaxdrug=max(predrugs), by(cvegeo)

gen postdrugs=sum(againdrugs) if year>=2017
egen postmaxdrug=max(postdrugs), by(cvegeo)


egen maxdrugs=max(againdrugs) if year>=2000 & year<2021, by(cvegeo)

*2007-2010 deaths calderon
egen deadf1=sum(deaths_total), by(cvegeo)


*edit cvegeo year group deaths_total deadf1 gdelt confront  if year>2000 & gdelt==0 & confront==0 & deadf1==0
***

gen destroyed=hapoppy+ hamarijuana+hamarijuana_semar


gen predestroyed=sum(destroyed) if year>=2000 & year<2017
egen premaxdestroyed=max(predestroyed), by(cvegeo)


gen postdestroyed=sum(destroyed) if year>=2017
egen postmaxdestroyed=max(postdestroyed), by(cvegeo)


egen maxdestroyed=max(destroyed) if year>=2000 & year<2021, by(cvegeo)


***narco-violence
*drop group
gen group=. 
replace group=0 if deadf1==0 & gdeltmax==0 & confontmaxallperiod==0 & maxdestroyed==0 & year>=2000
 *maxdrugs==0
replace group=1 if deadf1==0 & gdlconfmax>0 & premax==0 
*postmaxdrug>=0 & premaxdestroyed==0
*postmaxdrug>=0  &  premaxdrug==0 
*edit cvegeo year premaxdrug if group==1
tab group if year==2017

drop confront gdelt gdeltmax confontmaxallperiod sumgdltconfront gdlconfmax presumgdltconfront premax predrugs premaxdrug postdrugs postmaxdrug maxdrugs deadf1 destroyed predestroyed premaxdestroyed postdestroyed postmaxdestroyed maxdestroyed

**second type treated since year 2015

sort cvegeo year
*edit cvegeo year againdrugs 
*edit gdelt gdeltmax gdelt1 gdelt1cont group deaths_total deadf1 gdelt confront events_gdelt1 confrontation  if year>1999
***
egen conf1=sum(confrontationPf) if year>=2015, by(cvegeo)
egen conf1cont=sum(confrontationPf) if year>=2000 & year<2015, by(cvegeo)
gen confront=conf1 if year>=2015
replace confront=conf1cont if year>=2000 & year<2015
drop conf1 conf1cont

egen gdelt1=sum(events_gdelt1) if year>=2015, by(cvegeo)
egen gdelt1cont=sum(events_gdelt1) if year>=2000 & year<2015, by(cvegeo)


gen gdelt=gdelt1 if year>=2015
replace gdelt=gdelt1cont if year>=2000 & year<2015
drop gdelt1 gdelt1cont
egen gdeltmax=max(gdelt) if year>=2000, by(cvegeo)

egen confontmaxallperiod=max(confront) if year>=2000, by(cvegeo)
*drop sumgdltconfront
gen sumgdltconfront=gdelt+confront if year>=2015
egen gdlconfmax=max(sumgdltconfront) if year>=2000, by(cvegeo)

gen presumgdltconfront=gdelt+confront if year>=2000 & year<2015
egen premax=max(presumgdltconfront) if year>=2000, by(cvegeo)


gen predrugs=sum(againdrugs) if year>=2000 & year<2015
egen premaxdrug=max(predrugs), by(cvegeo)


gen postdrugs=sum(againdrugs) if year>=2015
egen postmaxdrug=max(postdrugs), by(cvegeo)


egen maxdrugs=max(againdrugs) if year>=2000 & year<2021, by(cvegeo)

*2007-2010
egen deadf1=sum(deaths_total), by(cvegeo)


*edit cvegeo year group deaths_total deadf1 gdelt confront  if year>2000 & gdelt==0 & confront==0 & deadf1==0
***

gen destroyed=hapoppy+ hamarijuana+hamarijuana_semar


gen predestroyed=sum(destroyed) if year>=2000 & year<2015
egen premaxdestroyed=max(predestroyed), by(cvegeo)


gen postdestroyed=sum(destroyed) if year>=2015
egen postmaxdestroyed=max(postdestroyed), by(cvegeo)


egen maxdestroyed=max(destroyed) if year>=2000 & year<2021, by(cvegeo)



gen group2=. 
replace group2=0 if deadf1==0 & gdeltmax==0 & confontmaxallperiod==0 & maxdestroyed==0 & year>=2000
 *maxdrugs==0
replace group2=1 if deadf1==0 & gdlconfmax>0 & premax==0 
*postmaxdrug>=0 & premaxdestroyed==0
*postmaxdrug>=0  &  premaxdrug==0 
*edit cvegeo year premaxdrug if group==1
tab group2 if year==2017

*edit cvegeo year group deaths_total deadf1 gdelt confront  if year>2000 & gdelt==0 & confront==0 & deadf1==0
drop confront gdelt gdeltmax confontmaxallperiod sumgdltconfront gdlconfmax presumgdltconfront premax predrugs premaxdrug postdrugs postmaxdrug maxdrugs deadf1 destroyed predestroyed premaxdestroyed postdestroyed postmaxdestroyed maxdestroyed

tab group if year==2017
tab group2 if year==2017

label var group "treatment start 2017"
label var group2 "treatment start 2015"
xtset cvegeo year


xtreg homicide_r i.year group if year<2016, fe

save "$final/deletememun.dta", replace

use "$final/deletememun.dta", clear

*common trend*
*gen treatment and control w/ homicide of women rate
gen t1women=hwomenr if group==1
gen c1women=hwomenr if group==0
gen t2women=hwomenr if group2==1
gen c2women=hwomenr if group2==0

label var t1women "homicide of women rate (Treatment 1)"
label var c1women "homicide of women rate (Control 1)"
label var t2women "homicide of women rate (Treatment 2)"
label var c2women "homicide of women rate (Control 2)"

*gen treatment and control w/ homicide of men rate

gen t1men=hmenr if group==1
gen c1men=hmenr if group==0
gen t2men=hmenr if group2==1
gen c2men=hmenr if group2==0

label var t1men "homicide of men rate (Treatment 1)"
label var c1men "homicide of men rate (Control 1)"
label var t2men "homicide of men rate (Treatment 2)"
label var c2men "homicide of men rate (Control 2)"


*collapse to creat common trend
collapse t1women c1women t2women c2women t1men c1men t2men c2men, by(year)
tsset year
tw(tsline t1women c1women), name(g1w, replace)
tw(tsline t2women c2women), name(g2w, replace)
tw(tsline t1men c1men), name(g1m, replace)
tw(tsline t2men c2men), name(g2m, replace)
graph combine g1w g2w g1m g2m , graphregion(color(white))
grapg save "$figure/trend.gph"



Junta con Naye para ver los puntos generales de Fortalece.
Junta con Ari para ver la presentación a las emprendedoras.
Seguimiento del indice crea. 
Seguimiento del reporte



*declare directory
global root "/Users/karlacruz/Dropbox/observatorio"
global outputs "/Users/karlacruz/Dropbox/observatorio/ENOE/outputs"
global data "/Users/karlacruz/Dropbox/observatorio/ENOE/dataset"
cd "$root"
 
*For pandemic ENOE doesnt has register to second period of 2020. we used ETOE for this period.
***************************
*****Unemploment rate******
***************************


forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
*delimit
*desocu_bus= desocupados con busquedad
gen desocu_bus=1 if clase3==6
replace desocu_bus=0 if desocu_bus==.
gen pea=1 if clase1==1
replace pea=0 if pea ==.
*g cvegeo
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*add if we need localidad
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
collapse (sum)desocu_bus pea [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen unempl_r= (desocu_bus/pea)*100
label var unempl_r "unemployment rate"
*save dataset
save "$outputs/unempl_r`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/unempl_r`i'.dta"
}
.

save  "$data/unempl_final.dta", replace




***************************
*****maleUnemploment rate******
***************************


forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
*delimit
keep if sex==1
*desocu_bus= desocupados con busquedad
gen desocu_bus=1 if clase3==6
replace desocu_bus=0 if desocu_bus==.
gen pea=1 if clase1==1
replace pea=0 if pea ==.
*g cvegeo
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*add if we need localidad
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
collapse (sum)desocu_bus pea [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen menunempl_r= (desocu_bus/pea)*100
label var menunempl_r "unemployment men rate"
*save dataset
save "$outputs/menunempl_r`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/menunempl_r`i'.dta"
}
.
 drop desocu_bus pea
save  "$data/menunempl_final.dta", replace



***************************
*****female Unemploment rate*
***************************


forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
*delimit
*desocu_bus= desocupados con busquedad
keep if sex==2
gen desocu_bus=1 if clase3==6
replace desocu_bus=0 if desocu_bus==.
gen pea=1 if clase1==1
replace pea=0 if pea ==.
*g cvegeo
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*add if we need localidad
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
collapse (sum)desocu_bus pea [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen womunempl_r= (desocu_bus/pea)*100
label var womunempl_r "unemployment women rate"
*save dataset
save "$outputs/femaleunempl_r`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/femaleunempl_r`i'.dta"
}
.
drop desocu_bus pea
save  "$data/femaleunempl_final.dta", replace

*****************************
**********Manufactory********
*****************************
forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear

tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
*clase1==1 Población económicamente activa
gen pob=1 if clase1==1
replace pob=0 if pob==. 
*rama== 2 Industria manufacturera
gen ocu_mac=1 if rama==2
replace ocu_mac=0 if ocu_mac==.
collapse  (sum)ocu_mac pob  [iw=fac], by(cvegeo year)
gen empl_man_r= (ocu_mac/pob1)*100
label var empl_man_r "manufacturing employment rate"
*save dataset
save "$outputs/manu_r`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/manu_r`i'.dta"
}
.

save  "$data/mac_final.dta", replace

************
*Informal_r*
************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
gen pob=1 if clase1==1
replace pob=0 if pob==. 
*emp_ppal==2 empleo informal
gen ocu_inf=1 if emp_ppal==2
replace ocu_inf=0 if ocu_inf==.
collapse (sum)ocu_inf pob [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen empl_inf_r= (ocu_inf/pob1)*100
label var empl_inf_r  "informal employment rate"
*save dataset
save "$outputs/empl_inf_r`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/empl_inf_r`i'.dta"
}
.

save  "$data/inf_final.dta", replace

*********************************
***********Gap salary************
*********************************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear

tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen gap= ((h_in - m_in)/h_in)*100
gen ln_gap= ln(gap)
drop gap
label var ln_gap  "wage gap"
 *Falta remplazar los missing*
*save dataset
save "$outputs/gap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/gap_`i'.dta"
}
.
save  "$data/gap_final.dta", replace
*********************************
***********Gap salary_Informal***
*********************************
forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear

tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
*informal==1
keep if emp_ppa==1
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_infgap= ln(gap)
 drop gap
 label var ln_infgap  "wage gap (informal)"

*save dataset
save "$outputs/infgap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/infgap_`i'.dta"
}
.
save  "$data/inf_gap_final.dta", replace

*********************************
***********Gap salary_formal***
*********************************
forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear

tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
*formal==2
keep if emp_ppa==2
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_forgap= ln(gap)
 drop gap
 label var ln_forgap  "wage gap (formal)"
 *Falta remplazar los missing*
*save dataset
save "$outputs/forgap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/forgap_`i'.dta"
}
.
save  "$data/for_gap_final.dta", replace
*********************************
*********Gap salary_manufacture**
*********************************
forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
*rama==2 is industry in manufactory
keep if rama==2
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_mgap= ln(gap)
 drop gap
 label var ln_mgap  "wage gap (manufacture)"
 *Falta remplazar los missing*
*save dataset
save "$outputs/manugap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/manugap_`i'.dta"
}
.
save  "$data/manu_gap_final.dta", replace

*********************************
***********Gap Age***************
*********************************
/*forvalues i=2016/2020 {
* generated a dummy for grupo of age
*use "$root/ENOE/original/ENOE_`i'.dta"
*gen grup_edad=.
*replace grup_edad=1 if eda>=15 &  eda<=30
*replace grup_edad=2 if eda>=31 &  eda<=50
*replace grup_edad=3 if eda>=51
*save "$root/ENOE_`i'.dta", replace
*}
*/


forvalues i=2010/20215 {
generated a dummy for grupo of age
use "$root/ENOE/original/ENOE_`i'.dta"
gen grup_edad=.
replace grup_edad=1 if eda>=15 &  eda<=30
replace grup_edad=2 if eda>=31 &  eda<=50
replace grup_edad=3 if eda>=51
save "$root/ENOE_`i'.dta", replace
}
.


*********************************
***********Gap 16_30_age*********
*********************************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
keep if grup_edad==1
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_16_30gap= ln(gap)
 drop gap
 label var ln_16_30gap  "wage gap (age 16_30)"
 *Falta remplazar los missing*
*save dataset
save "$outputs/16_30gap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/16_30gap_`i'.dta"
}
.
save  "$data/16_30gap_final.dta", replace


*********************************
***********Gap_30_50_age*********
*********************************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
keep if grup_edad==2
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_31_50gap= ln(gap)
 drop gap
 label var ln_31_50gap "wage gap (age 31_50)"
 *dont forget the missing values*
*save dataset
save "$outputs/31_50gap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/31_50gap_`i'.dta"
}
.
save  "$data/31_50gap_final.dta", replace

*********************************
***********Gap 51+ age***********
*********************************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta"
tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
keep if grup_edad==3
by cvegeo, sort: egen h_in= mean(ingocup) if sex==1
by cvegeo, sort: egen m_in= mean(ingocup) if sex==2
collapse h_in m_in [iw=fac], by(cvegeo year)
 gen gap= ((h_in - m_in)/h_in)*100
 gen ln_51gap= ln(gap)
 drop gap
 label var ln_51gap "wage gap (age 51+)"
*dont forget the missing values*
*save dataset
save "$outputs/51gap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/51gap_`i'.dta"
}
.
save  "$data/51gap_final.dta", replace




forvalues i=2010/2020 {
*generated a dummy for grupo of age
use "$root/ENOE/original/ENOE_`i'.dta"
gen años_escu=0
replace años_escu=3 if cs_p13_1==1
replace años_escu=9 if cs_p13_1==2
replace años_escu=12 if cs_p13_1==3
replace años_escu=15 if cs_p13_1==4
replace años_escu=19 if cs_p13_1==5
replace años_escu=15 if cs_p13_1==6
replace años_escu=19 if cs_p13_1==7
replace años_escu=21 if cs_p13_1==8
replace años_escu=26 if cs_p13_1==9

save "$root/ENOE_`i'.dta", replace
}
.
*********************************
***********Gap school************
*********************************

forvalues i=2010/2020 {
* data
use "$root/ENOE/original/ENOE_`i'.dta", clear

tostring mun, g(mun1) format(%03.0f)
tostring ent, g(ent1) format(%01.0f)
*tostring loc, g(localidad) format(%04.0f)
gen cvegeo= ent1+ mun1
destring cvegeo, replace
*gen cvegeo1= ent1+ mun1 + localidad
*br cvegeo cvegeo1
by cvegeo, sort: egen h_esc= mean(años_escu) if sex==1
by cvegeo, sort: egen m_esc= mean(años_escu) if sex==2
collapse h_esc m_esc [iw=fac], by(cvegeo year)
*collapse (sum)desocu_bus pea, by(cvegeo1 year)
gen gap= ((h_esc - m_esc)/h_esc)*100
gen ln_gapschool= ln(gap)
drop gap
label var ln_gapschool  "school gap"
 *Falta remplazar los missing*
*save dataset
save "$outputs/gap_`i'.dta", replace
}
.
clear
forvalues i=2010/2020{
append using "$outputs/schoolgap_`i'.dta"
}
.
save  "$data/schoolgap_final.dta", replace

https://www.unodc.org/documents/data-and-analysis/WDR2021/8.1_Prices_an_purities_of_Drugs.pdf
label var heroincol "kilograms of heroin seized in Colombia"
label var hydrochloride "kilograms of cocaine hydrochloride seized in colombia"
label var pastecocaine "kilograms of coca paste seized in colombia"
label var  cocaleaf "kilograms of coca leaf seized in colombia"
