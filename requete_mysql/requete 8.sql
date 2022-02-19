with
-- prix du m² pour un 2 pieces --
	appT2 as 
		(select round(avg(val_fon / bien.surf_carrez),2) as prixT2 from vente
		inner join bien on bien.id_bien = vente.id_bien
		where nb_piece = 2 and type_local like "app%"),
-- prix du m² pour un 3 pieces --
	appT3 as
		(select round(avg(val_fon / bien.surf_carrez),2) as prixT3 from vente
		inner join bien on bien.id_bien = vente.id_bien
		where nb_piece = 3 and type_local like "app%")
                
select 	prixT2,
		prixT3, 
        round(((prixT2 - prixT3)*100 / prixT3 ),2) as "diff en %"
	from appT2, appT3;