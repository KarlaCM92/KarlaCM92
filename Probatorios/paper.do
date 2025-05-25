
**************************************
***Step 1: Set path to libraries
**************************************
global root "D:\Dropbox\observatorio"
global all "D:\Dropbox\observatorio\modelo\dta_clean" 
global result "D:\Dropbox\observatorio\papers\karla\1. narcofeminicides\5. tables and figs"
global final "D:\Dropbox\observatorio\papers\karla\1. narcofeminicides\6.masterfiles"
cd "D:\Dropbox\observatorio"


global root "/Users/karlacruz/Dropbox/observatorio"
global all "$root/modelo/dta_clean" 
global result "$root/modelo/result"
global final "$root/papers/karla/1. narcofeminicides/6.masterfiles"
global  result "$root/papers/karla/1. narcofeminicides/5. tables and figs"
cd "$root"

*********************************************
**Step 2: Analysis by municipality
********************************************
use "$final/deletememun.dta", clear
*collapse (sum) protocolo penalfederal penal_inj ndfm penal_states intimate infant familiar weapons guns communitary genderor armconflict byconexion femicidesnsp_r femiwguns_r femiweapon_r, by (year)

xtset cvegeo year
*removing non-important information
drop if year==2021
drop if year<2016
drop if group==. 
*recoding missing variables
recode femicidesnsp_r femiwguns_r femiweapon_r hwomenr  hmenr homicide_r  protocolo penalfederal penal_inj ndfm penal_states intimate infant familiar weapons guns communitary genderor armconflict byconexion femicidesnsp_r femiwguns_r femiweapon_r protocolo_r penalfederal_r penal_inj_r ndfm_r penal_states_r intimate_r infant_r familiar_r weapons_r guns_r communitary_r genderor_r armconflict_r byconexion_r femicidesnsp_r femiwguns_r femiweapon_r (.=0)


*gen time. Our pre-period is 2016 and treatment starts in 2017
gen period1=1 if year>=2017 & year<2021
replace period1=0 if period1==. & year<2017

*generating interaction
gen t1xp1= group*period1
label variable t1xp1 "Interaction treatment and period of treatment"


***generating dummy variables for each year
tab year, gen(time)

gen changetemp= 100*(temp_mean-l.temp_mean)/l.temp_mean
label variable changetemp "annual percentage change in temperature"

*edit hydrochloride heroincol
*destring hydrochloride, gen(hydrochloridecolombia)  dpcomma 
*destring heroincol, gen(heroincolcolombia)  dpcomma 


********************************************************
****Table 1: Diff-in-diff with panel fixed effects
********************************************************
capture erase "$result\Table1.xls"
capture erase "$result\Table1.txt"

capture erase "$result\Table1a.xls"
capture erase "$result\Table1a.txt"

**these are potential dependent variables
*global observatory homici_obs_r femicide_r intimate_r infant_r familiar_r armconflict_r byconexion_r communitary_r genderor_r guns_r weapons_r
*global snsp  femicidesnsp_r femiwguns_r femiweapon_r hwomenr  hmenr homicide_r
global control  urban    nl_sum
*empl_inf_r


foreach var of varlist femicidesnsp_r homicide_r protocolo_r penalfederal_r penal_inj_r ndfm_r penal_states_r intimate_r infant_r familiar_r weapons_r guns_r communitary_r genderor_r armconflict_r byconexion_r femicidesnsp_r femiwguns_r femiweapon_r {
xtreg  `var' group t1xp1 i.year if year>=2016 & year<2021, fe  cl(cvegeo)
outreg2 using "$result\Table1.xls",  se bdec(3) e(r2_a) excel append 
}



foreach var of varlist femicidesnsp_r homicide_r {
xtreg  `var' group t1xp1 i.year $control if year>=2016 & year<2021, fe  cl(cvegeo)
outreg2 using "$result\Table1.xls",  se bdec(3) e(r2_a) excel append 
}

*********************************************************
****Table 2: Diff-in-diff with IV panel fixed effects
***********************************************************
*global controliv empl_inf_r  nl_sum 
**ommited dependent variables: femiwguns_r femiweapon_r homiwomen_r  hmenr  homicide_r
global instruments  inter12 rain_mean

*missing homiwomen_r
capture program drop ivreg
program define ivreg
*femicidesnsp_r femiwguns_r femiweapon_r   hmenr  homicide_r 
*protocolo penalfederal penal_inj ndfm penal_states intimate infant familiar weapons guns communitary genderor armconflict byconexion femicidesnsp_r femiwguns_r femiweapon_r 
foreach var of varlist protocolo_r penalfederal_r penal_inj_r ndfm_r penal_states_r intimate_r infant_r familiar_r weapons_r guns_r communitary_r genderor_r armconflict_r byconexion_r femicidesnsp_r femiwguns_r femiweapon_r {
xi: xtivreg `var' (t1xp1=$instruments) time2 time3 time4 time5, fe first 
*vce(cluster cvegeo) 
xtoverid
dmexogxt 
*outreg2 using "$result\Table2.xls",  se bdec(3) e(r2_a) excel append 
}
end























xtreg t2xp2  $instruments if e(sample)==1, fe vce(cluster cvegeo)
outreg2 using "$result\TableA1.xls", dec(3) excel append
}


**********************
***STEP 3
************************
****************
*Base malla
use "$final/allcelda2000_2020.dta", clear
xtset id year

****
end
************
*coarse matching
**************

*ssc install cem, all
*manually install cem-mata.do in C:\Users\ado\plus/c/cem-mata.do 
 *https://github.com/IQSS/cem-stata/find/master
*imb changetemp borderdist portdist gini, treatment(group2)
*cem changetemp borderdist portdist gini, treatment(group2)
*xi: xtivreg `var' ($endogenous=$instruments) time16 time17 time18 time19 time20 time21 if year>=2014 & year<2021 ,  fe first vce(
*regress  parheight trd male i.ethnicity [iweight=cem_weights], $ses

*destring hydrochloride, replace force







**cut because we don't have enough data for 2014 as pre
gen period2=1 if year>=2015 & year<2021

replace period2=0 if period2==. & year<2015
gen t2xp2= group2*period2

