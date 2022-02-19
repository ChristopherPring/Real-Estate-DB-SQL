select count(distinct id_vente) as `nombre d'appartements vendus au premier semestre` 
	from vente
	inner join bien on vente.id_bien = bien.id_bien
	where type_local = 'appartement' 
    and vente.date_mut between '2020-01-01' and '2020-06-30';