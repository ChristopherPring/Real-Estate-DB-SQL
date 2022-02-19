with
-- classement des communes par la valeur foncière moyenne --
top as (
		select dep, nom, round(avg(val_fon),2) as avgvalfon 
			from commune
				inner join bien on bien.id_commune = commune.id_commune
				inner join vente on vente.id_bien = bien.id_bien
			where dep in ('6', '13', '33', '59', '69')
			group by nom
			order by dep, avgvalfon DESC),
-- ajout d'un rang à chaque tuple par département --
classement as (
		select dep, nom, avgvalfon, RANK() OVER (PARTITION BY dep ORDER BY avgvalfon DESC) as rang
			from top)
-- sélection des 3 premiers --            
select dep, nom, avgvalfon, rang from classement
where rang < 4;