-- liste des 10 appartements les plus chers --

select vente.val_fon, bien.surf_reelle, substr(bien.id_bien,1 ,2) 
as departement, adresse
	from vente
    inner join bien on bien.id_bien = vente.id_bien
    where bien.type_local = 'appartement'
    order by val_fon DESC
    limit 10;