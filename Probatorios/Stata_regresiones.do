******Con la probabilidad estandarizada***
xtreg tasa_homicidios prob2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido prob2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido prob2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido prob2 i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos prob2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos prob2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos prob2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE prob2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2 i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita prob2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita prob2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label





***Noruega******. ROBUSTOS


xtreg tasa_homicidios probxlnnoruega i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios probxlnnoruega i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios probxlnnoruega  i.ano#c.entidad i.ano#c.idh i.ano#c.pob i.ano#c.IRS, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido probxlnnoruega i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido probxlnnoruega i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido probxlnnoruega  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos probxlnnoruega i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos probxlnnoruega i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos probxlnnoruega i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE probxlnnoruega i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE probxlnnoruega i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE probxlnnoruega  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita probxlnnoruega i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita probxlnnoruega i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita probxlnnoruega i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label




******Efectos. heterogeneos*** BORDER
xtreg tasa_homicidios bordernuevo border2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios bordernuevo border2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios bordernuevo border2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido bordernuevo border2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido bordernuevo border2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido bordernuevo border2 i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos bordernuevo border2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos bordernuevo border2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos bordernuevo border2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE bordernuevo border2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE bordernuevo border2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE bordernuevo border2  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita bordernuevo border2 i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita bordernuevo border2 i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita bordernuevo border2 i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label



******Efectos. heterogeneos*** highway
xtreg tasa_homicidios prob2Xhighway highwayXPrecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2Xhighway highwayXPrecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2Xhighway highwayXPrecio  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido prob2Xhighway highwayXPrecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido prob2Xhighway highwayXPrecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido prob2Xhighway highwayXPrecio  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos prob2Xhighway highwayXPrecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos prob2Xhighway highwayXPrecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos prob2Xhighway highwayXPrecio  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE prob2Xhighway highwayXPrecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2Xhighway highwayXPrecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2Xhighway highwayXPrecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita prob2Xhighway highwayXPrecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2Xhighway highwayXPrecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita prob2Xhighway highwayXPrecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label


******Efectos. heterogeneos*** PRESENCIA
xtreg tasa_homicidios prob2Xpresencia presenciaXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2Xpresencia presenciaXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2Xpresencia presenciaXprecio  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido prob2Xpresencia presenciaXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido prob2Xpresencia presenciaXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido prob2Xpresencia presenciaXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos prob2Xpresencia presenciaXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos prob2Xpresencia presenciaXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos prob2Xpresencia presenciaXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE prob2Xpresencia presenciaXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2Xpresencia presenciaXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2Xpresencia presenciaXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita prob2Xpresencia presenciaXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2Xpresencia presenciaXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita prob2Xpresencia presenciaXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label


******Efectos. heterogeneos*** PRESENCIA more carteles
xtreg tasa_homicidios prob2xmorecartel morecartelXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2xmorecartel morecartelXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2xmorecartel morecartelXprecio  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label
/* desaparecidos con ceros rellenados*/ /*es más veridico este*/
xtreg tasa_desaparecido prob2xmorecartel morecartelXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas4.doc", replace label
xtreg tasa_desaparecido prob2xmorecartel morecartelXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas5.doc", replace label
xtreg tasa_desaparecido prob2xmorecartel morecartelXprecio  i.ano#c.entidad i.ano#c.idh i.ano#c.pob i.ano#c.sin_drenaje i.ano#c.sin_energia i.ano#c.sin_salud , fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas6.doc", replace label



xtreg  tasa_delitos prob2xmorecartel morecartelXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas7.doc", replace label
xtreg  tasa_delitos prob2xmorecartel morecartelXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas8.doc", replace label
xtreg  tasa_delitos prob2xmorecartel morecartelXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas9.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE prob2xmorecartel morecartelXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2xmorecartel morecartelXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2xmorecartel morecartelXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita prob2xmorecartel morecartelXprecio i.ano, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2xmorecartel morecartelXprecio i.ano#c.entidad, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas14.doc", replace label
xtreg lnconsumo_percapita prob2xmorecartel morecartelXprecio i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label


 prob2xlnpolice lnpolmindistXPrecioUSA
 
 
 ******Efectos. heterogeneos*** distancia cercana
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias if polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label

xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA  i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias if polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label



xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas1.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas2.doc", replace label
xtreg tasa_homicidios prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias  if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas3.doc", replace label

/*CONSECUENCIAS ECONOMICAS*/

xtreg lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias  if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label


xtreg lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label


xtreg lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas10.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas11.doc", replace label
xtreg  lnconsumo_porUE prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas12.doc", replace label



xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablaa14.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias i.ano#c.sin_salud  if  polmindist <= 10, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label


xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablaa14.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberiasif  polmindist <= 20, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label

xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas13.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablaa14.doc", replace label
xtreg lnconsumo_percapita prob2xlnpolice lnpolmindistXPrecioUSA i.ano#c.entidad i.ano#c.pobla i.ano#c.analfabetismo i.ano#c.noasisteniños i.ano#c.sineducacion18 i.ano#c.sinsaludd  i.ano#c.noexcusados i.ano#c.irezag i.ano#c.noelectriciti i.ano#c.notuberias if  polmindist <= 30, fe cl(claveinegi)
outreg2 using "/Users/karlacruz/Desktop/outreg2/tablas15.doc", replace label
