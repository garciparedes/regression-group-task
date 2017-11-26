/*
 * University: Universidad de Valladolid
 * Degree: Grado en Estadística
 * Subject: Regresión y ANOVA
 * Year: 2017/18
 *
 * Teacher: Lourdes Barba Escribá
 *
 * Author: Esther Cuervo Fernández
 * Author: Sergio García Prado (garciparedes.me)
 * Author: Pablo Martín Villares
 *
 * Name: Regresión - Práctica por grupos - Mantenimiento de Copiadoras
 *
 */

filename reffile '/folders/myshortcuts/sas/regression-group-task/data/CH01PR20.csv';

proc import datafile=reffile dbms=csv out=copiers;
	getnames=yes;
run;

proc print data=copiers;
run;

proc reg data=copiers;
	model y=x /clb alpha=0.1;
	id x;
run;

data copiers_new_observation;
	x = 5;
run;

proc append base=copiers data=copiers_new_observation;
run;

proc reg data=copiers;
	model y = x /r;
	id x;
run;

data copiers_new_observation;
	x = 6;
run;

proc append base=copiers data=copiers_new_observation;
run;

proc reg data=copiers;
	model y = x /r cli clm alpha=0.1;
	id x;
run;