clear all
*declare directory
global root "/Users/karlacruz/Desktop/final_project/"
global original "$root/data_bases/homicidios90_22"
global result "$root/data_bases/result"


*Append for all databases in excel format 

forvalues i=1990/2022{
import delimited "$original/DEFUN`i'.csv", case(lower) encoding(ISO-8859-1)clear
save "$result/DEFUN`i'.dta", replace
}
.

forvalues i=1990/2022{
append using "$result/DEFUN`i'.dta", force
}
.
save "$result/DEFUN90_22.dta", replace

*keep the necesary variables
u "$result/DEFUN90_22.dta", clear
keep mun_ocurr ent_ocurr lista_mex sexo lengua nacionalid edad anio_ocur ocupacion escolarida edo_civil lista_bas causa_def
tostring mun_ocurr, g(mun) format(%03.0f)
tostring ent_ocurr, g(ent) format(%01.0f)
gen cl_inegi= ent+ mun
destring cl_inegi, replace
label var cl_inegi "clave inegi municipio"
gen homicide= 1 if lista_mex=="55" | lista_bas==55

save "$result/DEFUN90_22clean.dta", replace
*codebook
*gen nacionalidad== ""
*replace nacionalidad = "Nacional" if nacionalid== 1
*replace nacionalidad = "Extranjero" if nacionalid== 2
*replace nacionalidad = "NE" if nacionalid== 9

u "$result/DEFUN90_22clean.dta", clear
*** homicide***
preserve 
*Collapse
collapse (sum)homicide, by(cl_inegi anio_ocur)
label var homicide "Homicide
save "$result/HOMIN90_22.dta", replace

restore


preserve 

collapse (sum)homicide, by(cl_inegi anio_ocur sexo)

keep if sexo==1
rename homicide homicide_man
drop sexo
save "$result/HOMI_MAN90_22.dta", replace

restore


preserve

collapse (sum)homicide, by(cl_inegi anio_ocur sexo)
keep if sexo==2
rename homicide homicide_woman
drop sexo
save "$result/HOMI_WOM90_22.dta", replace

restore

*** homicide guns***

u "$result/DEFUN90_22clean.dta", clear
sort causa_def
keep if causa_def== "X930" | causa_def== "X931" | causa_def== "X932"  | causa_def== "X933" | causa_def== "X934" | causa_def== "X935" | causa_def== "X936" | causa_def== "X937" | causa_def== "X938" | causa_def== "X939" | causa_def== "X940"| causa_def== "X941" | causa_def== "X942" | causa_def== "X943" | causa_def== "X944" | causa_def== "X945" | causa_def== "X946" | causa_def== "X947" | causa_def== "X948" | causa_def== "X949" | causa_def== "X950" | causa_def== "X951" | causa_def== "X952" | causa_def== "X953" | causa_def== "X954" | causa_def== "X955" | causa_def== "X956" | causa_def== "X957" | causa_def== "X958" | causa_def== "X959" | causa_def== "X960" | causa_def== "X961" | causa_def== "X962" | causa_def== "X963" | causa_def== "X964" | causa_def== "X965" | causa_def== "X966" | causa_def== "X967" | causa_def== "X968" | causa_def== "X969" | causa_def== "X960"
gen homiguns=1
save "$result/HOMI_GUNS90_22clasf.dta", replace
*Collapse

preserve

	collapse (sum)homiguns, by(cl_inegi anio_ocur)
	label var homiguns "Homicide of guns"
	save "$result/HOMI_GUNS90_22.dta", replace

restore


preserve

	collapse (sum)homiguns, by(cl_inegi anio_ocur sexo)
	keep if sexo==1
	rename homiguns homigunsman
	drop sexo
	save "$result/HOMI_GUNSM90_22.dta", replace
restore


preserve

	collapse (sum)homiguns, by(cl_inegi anio_ocur sexo)
	keep if sexo==2
	rename homiguns homigunswoman
	drop sexo
	save "$result/HOMI_GUNSw90_22.dta", replace

	
restore


*apped
u "$result/HOMIN90_22.dta", clear
merge 1:1 cl_inegi anio_ocur using "$result/HOMI_MAN90_22.dta"
drop _merge

merge 1:1 cl_inegi anio_ocur using "$result/HOMI_WOM90_22.dta"
drop _merge
merge 1:1 cl_inegi anio_ocur using "$result/HOMI_GUNS90_22.dta"
drop _merge
merge 1:1 cl_inegi anio_ocur using "$result/HOMI_GUNSM90_22.dta"
drop _merge
merge 1:1 cl_inegi anio_ocur using "$result/HOMI_GUNSw90_22.dta"
drop _merge

keep if anio_ocur>=1990 & anio_ocur<=2022

save "$result/homicidios_clean.dta", replace


use "$root/data_bases/antidrog_1990-2022_062023.dta", clear

rename cvemunicipio cl_inegi 
rename año anio_ocur 


collapse (sum)AmpFen_SEDENA AseCoc_SEDENA AseFen_SEDENA AseGomOpio_SEDENA AseHer_SEDENA AseMar_SEDENA AseMet_SEDENA HecAma_fum_SEDENA HecAma_man_SEDENA HecMar_fum_SEDENA HecMar_man_SEDENA IncCoc_SEDENA IncGomOpio_SEDENA IncHer_SEDENA IncMar_SEDENA IncMet_SEDENA IncSemAma_SEDENA IncSemMar_SEDENA LabCoc_SEDENA LabHer_SEDENA LabMet_SEDENA PasFen_SEDENA PlaAma_fum_SEDENA PlaAma_man_SEDENA PlaMar_fum_SEDENA PlaMar_man_SEDENA SemAma_SEDENA SemMar_SEDENA AseCoc_SEMAR AseHer_SEMAR AseMar_SEMAR AseMet_SEMAR M2Ama_SEMAR M2Mar_SEMAR PlantasAma_SEMAR PlantasMar_SEMAR PlantiosAma_SEMAR PlantiosMar_SEMAR SemAma_SEMAR SemMar_SEMAR pf_1 pf_2 pf_4 pf_5 pf_6 pf_7 pf_8 pf_9 pf_10 pf_11 gn_1 gn_2 gn_4 gn_6 gn_8 gn_9 gn_10 gn_11 gn_12 gn_13 ,by(cl_inegi anio_ocur)

save "$result/antidrogyear.dta", replace

*población*

**********************************
******Firts part of population****
***************2000_2014**********
clear
import excel "$root/data_bases/projections_2000_2014.xlsx", sheet("Hoja1") firstrow clear
egen pob= rowtotal(pob0a4años pob5a9años pob10a14años pob15a19años pob20a24años pob25a29años pob30a34años pob35a39años pob40a44años pob45a49años pob50a54años pob55a59años pob60a64años pob65ymásaños)
collapse (sum) pob, by(CLAVE SEXO AÑO)
rename CLAVE cl_inegi 
rename AÑO anio_ocur
rename SEXO sexo
save "$result/pop_2000_2014.dta", replace

**********************************
******Second part of population***
***************2015_2022**********
clear
import delimited "$root/data_bases/projections_2015-2030_01.csv", encoding(ISO-8859-1)
keep if año<=2022
collapse (sum) pob, by(clave año sexo)
rename clave cl_inegi 
rename año anio_ocur
save "$result/pop1_2015_2022.dta", replace

clear
import delimited "$root/data_bases/projections_2015-2030_02.csv", encoding(ISO-8859-1)
keep if año<=2022
collapse (sum) pob, by(clave año sexo)
rename clave cl_inegi 
rename año anio_ocur
save "$result/pop2_2015_2022.dta", replace


clear
use "$result/pop_2000_2014.dta", clear
append using "$result/pop2_2015_2022.dta" "$result/pop1_2015_2022.dta"
label var pob "population total"
save "$result/pop_final2000_2022.dta", replace

************************
*Poblation total by sex*
************************
preserve

keep if sexo=="Mujeres"
rename pob pob_women
drop sexo
label var pob_women "Population of women"
save "$result/popwomen_final2000_2022.dta", replace

restore


preserve

keep if sexo=="Hombres"
rename pob pob_men
drop sexo
label var pob_men "Population of men"
save "$result/popmen_final2000_2022.dta", replace

restore


clear

import delimited "$root/data_bases/AGEEML_20231271447147.csv", encoding(UTF-8)clear
keep cve_ent nom_ent nom_abr cve_mun nom_mun
tostring cve_mun, g(mun) format(%03.0f)
tostring cve_ent, g(ent) format(%01.0f)
gen cl_inegi= ent+ mun
destring cl_inegi, replace
duplicates drop nom_ent nom_mun cl_inegi, force
gen anio_ocur=.

save "$result/cl_inegi.dta", replace


forvalues i=1990/2022{
use "$result/cl_inegi.dta", clear
replace anio_ocur=`i' if anio_ocur==.
save "$result/cl_inegi`i'.dta", replace
}
.

forvalues i=1990/2021{
append using "$result/cl_inegi`i'.dta"
}
.
save "$result/cl_inegifinal.dta", replace


*Merge
u  "$result/homicidios_clean.dta" , clear

merge 1:1 cl_inegi anio_ocur using "$result/popmen_final2000_2022.dta"
drop _merge

merge 1:1 cl_inegi anio_ocur using "$result/popwomen_final2000_2022.dta"
drop _merge

merge 1:1 cl_inegi anio_ocur using "$result/antidrogyear.dta"
drop _merge

merge m:m  anio_ocur using "$root/data_bases/prices_drugs1990_2021.dta"
drop _merge

merge m:m  cl_inegi anio_ocur using "$result/cl_inegifinal.dta"

save "$result/finaldata.dta", replace
gen incocaina= gn_4 + AseCoc_SEMAR + IncCoc_SEDENA + pf_4 +AseCoc_SEDENA
replace incocaina=0 if incocaina==.
gen inheroin= gn_6+ AseHer_SEMAR+ IncHer_SEDENA+ AseHer_SEDENA+ pf_6
replace inheroin=0 if inheroin==.
gen carte_trasiegoC=0 
replace carte_trasiegoC=1 if incocaina >0
gen carte_trasiegoH=0 
replace carte_trasiegoH=1 if inheroin >0
save "$result/finaldataMUN.dta", replace
*gen newvar = pob_men
*bysort cl_inegi (anio_ocur): replace newvar = newvar[_n-1] if missing(newvar) & _n>1 

*Level state for homework
u "$result/finaldataMUN.dta", replace

collapse (sum)homicide homicide_man homicide_woman homiguns homigunsman homigunswoman AmpFen_SEDENA AseFen_SEDENA AseCoc_SEDENA AseGomOpio_SEDENA AseHer_SEDENA AseMar_SEDENA AseMet_SEDENA HecAma_fum_SEDENA HecAma_man_SEDENA HecMar_fum_SEDENA HecMar_man_SEDENA IncCoc_SEDENA IncGomOpio_SEDENA IncHer_SEDENA IncMar_SEDENA IncMet_SEDENA IncSemAma_SEDENA IncSemMar_SEDENA LabCoc_SEDENA LabHer_SEDENA LabMet_SEDENA PasFen_SEDENA PlaAma_fum_SEDENA PlaAma_man_SEDENA PlaMar_fum_SEDENA PlaMar_man_SEDENA SemAma_SEDENA SemMar_SEDENA AseCoc_SEMAR AseHer_SEMAR AseMar_SEMAR AseMet_SEMAR M2Ama_SEMAR M2Mar_SEMAR PlantasAma_SEMAR PlantasMar_SEMAR PlantiosAma_SEMAR PlantiosMar_SEMAR SemAma_SEMAR SemMar_SEMAR pf_1 pf_2 pf_4 pf_5 pf_6 pf_7 pf_8 pf_9 pf_10 pf_11 gn_1 gn_2 gn_4 gn_6 gn_8 gn_9 gn_10 gn_11 gn_12 gn_13 pob_men pob_wom pob, by(cve_ent nom_ent ent anio_ocur)


gen homicr=(homicide/pob)*100000

gen hmenr=(homicide_man/pob_men)*100000
gen hwomenr=(homicide_woman/pob_wom)*100000

gen hgunswomr=(homigunswoman/pob_wom)*100000
gen hgunsmenr=(homigunsman/pob_men)*100000

gen homiguns_r=(homiguns/pob)*100000

merge m:m  anio_ocur using "$root/data_bases/prices_drugs1990_2021.dta"
gen year= anio_ocur
tostring year, replace
gen incocaina= gn_4 + AseCoc_SEMAR + IncCoc_SEDENA + pf_4 +AseCoc_SEDENA
replace incocaina=0 if incocaina==.
gen inheroin= gn_6+ AseHer_SEMAR+ IncHer_SEDENA+ AseHer_SEDENA+ pf_6
replace inheroin=0 if inheroin==.
gen carte_trasiegoC=0 
replace carte_trasiegoC=1 if incocaina >0
gen carte_trasiegoH=0 
replace carte_trasiegoH=1 if inheroin >0
*gen logy=log(homicr)
*gen lgx1=log(inheroin)
*gen logx2= log(heroin_average_wholesale)
drop if cve_ent==.
g t_plantios= PlantiosAma_SEMAR + PlaAma_fum_SEDENA +PlaAma_man_SEDENA + pf_1 + gn_1

g t_hectareas= HecAma_fum_SEDENA + HecAma_man_SEDENA 
*convertir las variables en dummy
*keep homicr homicr hmenr hwomenr hgunswomr hgunsmenr homiguns_r heroin_average_wholesale cocaine_average_wholesale incocaina inheroin carte_trasiegoC carte_trasiegoH year anio_ocur cve_ent ent nom_ent
save "$result/finaldataENT.dta", replace




*****Label**
label var homicide "Número de homicidios"
label var homicide_man "Número de homicidios de hombres"
label var homicide_woman "Número de homicidios de mujeres"
label var homiguns "Número de homicidios con armas de fuego"
label var homigunsman "Número de homicidios de hombres con armas de fuego"
label var homigunswoman "Número de homicidios de mujeres con armas de fuego"
label var AmpFen_SEDENA "Número de ampolletas de fentanilo aseguradas por la SEDENA"
label var AseCoc_SEDENA "kilogramos de cocaína asegurados por la SEDENA"
label var AseFen_SEDENA "kilogramos de fentanilo asegurados por la SEDENA"
label var AseGomOpio_SEDENA "kilogramos de goma de opio asegurados por la SEDENA"
label var AseHer_SEDENA "kilogramos de heroína asegurados por la SEDENA"
label var AseMar_SEDENA "kilogramos de marihuana asegurados por la SEDENA"
label var AseMet_SEDENA "kilogramos de metanfetamina asegurados por la SEDENA"
label var HecAma_fum_SEDENA "hectáreas de amapola destruidos por fumigación por la SEDENA"
label var HecAma_man_SEDENA "hectáreas de amapola destruidos por mano de obra por la SEDEN"
label var HecMar_fum_SEDENA "hectáreas de marihuana destruidas por fumigación por la SEDENA"
label var HecMar_man_SEDENA "hectáreas de marihuana destruidas por mano de obra por la SEDENA"
label var IncCoc_SEDENA "kilogramos de cocaína incinerados por la SEDENA"
label var IncGomOpio_SEDENA "kilogramos de goma de opio incinerados por la SEDENA"
label var IncHer_SEDENA "kilogramos de heroína incinerados por la SEDENA"
label var IncMar_SEDENA "kilogramos de marihuana incinerados por la SEDENA"
label var IncMet_SEDENA "kilogramos de metanfetamina incinerados por la SEDENA"
label var IncSemAma_SEDENA "kilogramos de semilla de amapola incinerados por la SEDENA"
label var IncSemMar_SEDENA "kilogramos de semilla de marihuana incinerados por la SEDENA"
label var LabCoc_SEDENA "laboratorios para la producción de cocaina asegurados por la SEDENA"
label var LabHer_SEDENA "laboratorios para la producción de heroína asegurados por la SEDENA"
label var LabMet_SEDENA "laboratorios para la producción de metanfetamina asegurados por la SEDENA"
label var PasFen_SEDENA "pastillas de fentanilo aseguradas por la SEDENA"
label var PlaAma_fum_SEDENA "plantíos de amapola destruidos por fumigación por la SEDENA"
label var PlaAma_man_SEDENA "plantíos de amapola destruidos por mano de obra por la SEDENA"
label var PlaMar_fum_SEDENA "plantíos de marihuana destruidos por fumigación por la SEDENA"
label var PlaMar_man_SEDENA "plantíos de marihuana destruidos por mano de obra por la SEDENA"
label var SemAma_SEDENA "kilogramos de semilla de amapola asegurados por la SEDENA"
label var SemMar_SEDENA "kilogramos de semilla de marihuana asegurados por la SEDENA"
label var AseCoc_SEMAR "kilogramos de cocaína asegurados por la SEMAR"
label var AseHer_SEMAR "kilogramos de heroína asegurados por la SEMAR"
label var AseMar_SEMAR "kilogramos de marihuana asegurados por la SEMAR"
label var AseMet_SEMAR "kilogramos de metanfetamina asegurados por la SEMAR"
label var M2Ama_SEMAR "plantios de amapola en metros cuadrados asegurados por la SEMAR"
label var M2Mar_SEMAR "plantios de marihuana en metros cuadrados asegurados por la SEMAR"
label var PlantasAma_SEMAR "plantas de amapola asegurados por la SEMAR"
label var PlantasMar_SEMAR "plantas de marihuana asegurados por la SEMAR"
label var PlantiosAma_SEMAR "plantíos de amapola destruidos por la SEMAR"
label var PlantiosMar_SEMAR "plantios de marihuana asegurados por la SEMAR"
label var SemAma_SEMAR "kilogramos de semilla de amapola asegurados por la SEMAR"
label var SemMar_SEMAR "kilogramos de semilla de marihuana asegurados por la SEMAR"
label var pf_1 "plantíos de amapola localizados por la PF"
label var pf_2 "plantíos de marihuana localizados por la PF"
label var pf_4 "kilogramos de cocaína asegurados por la PF"
label var pf_5 "kilogramos de cristal asegurados por la PF"
label var pf_6 "kilogramos de heroína asegurados por la PF"
label var pf_7 "kilogramos de ice asegurados por la PF"
label var pf_8 "kilogramos de marihuana asegurados por la PF"
label var pf_9 "kilogramos de metanfetamina asegurados por la PF"
label var pf_10 "kilogramos de otras drogas asegurados por PF"
label var pf_11 "laboratorios para la fabricación de narcóticos localizados por la PF"
label var gn_1 "plantíos de amapola asegurados por la GN"
label var gn_2 "plantíos de marihuana asegurados por la GN"
label var gn_4 "kilogramos de cocaína asegurados por la GN"
label var gn_6 "kilogramos de heroína asegurados por la GN"
label var gn_8 "kilogramos de marihuana asegurados por la GN"
label var gn_9 "kilogramos de metanfetamina asegurados por la GN"
label var gn_10 "kilogramos de otras drogas asegurados por la GN"
label var gn_11 "laboratorios para la fabricacíon de narcóticos localizados por la GN"
label var gn_12 "kilogramos de fentanilo asegurados por la GN"
label var homicr "Tasa de homicidios"
label var hmenr "Tasa de homicidios de hombres"
label var hwomenr "Tasa de homicidios de mujeres"
label var hgunswomr "Tasa de homicidios de mujeres con arma de fuego"
label var hgunsmenr "Tasa de homicidios de hombres con arma de fuego"
label var homiguns_r "Tasa de homicidios con arma de fuego"
label var pob_men "Total de la población hombres"
label var pob_wom "Total de la población mujeres"
label var pob "Total de la población"
drop _merge
save "$result/finaldata.dta", replace
