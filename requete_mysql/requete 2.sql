-- calcul de la proportion des ventes d'appartements par le nombre de pièces -- 

select 	nb_piece as "nombre de pièces",
		round(count(nb_piece)*100 / (select count(*) from bien), 2) as proportion 
	from bien
	where type_local = "appartement"  
	group by nb_piece
	order by nb_piece;