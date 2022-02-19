with

-- calcul du nombre de ventes au premier trimestre --
trimestre1 as
(select count(date_mut) as nb_ventes1 from vente 
where date_mut between '2020-01-01' and '2020-03-31'),

-- calcul du nombre de ventes au deuxième trimestre --
trimestre2 as
(select count(date_mut) as nb_ventes2 from vente 
where date_mut between '2020-04-01' and '2020-06-30')

-- calcul du taux d'evolution des ventes entre les deux trimestres --
select	nb_ventes1 as "ventes au premier trimestre",
		nb_ventes2 as "ventes au deuxième trimestre",
        round((nb_ventes2 - nb_ventes1) * 100 / (nb_ventes1), 2) as "taux d'évolution (en %)"
from trimestre1, trimestre2;