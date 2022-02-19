-- liste des 10 départements où le prix du m² est le plus élevé -- 

select 	dep, 
		round(avg(vente.val_fon / bien.surf_carrez),2) as prix_du_m²
	from commune
	inner join bien on bien.id_commune = commune.id_commune
	inner join vente on vente.id_bien = bien.id_bien
	group by dep
	order by prix_du_m² DESC
	limit 10;