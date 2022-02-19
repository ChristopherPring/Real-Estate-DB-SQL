with 
-- table provisoire trimestre 1 --
trim1 as
	(select commune.id_commune, nom, count(*) as nbventes1 from commune
	inner join bien on bien.id_commune = commune.id_commune
	inner join vente on vente.id_bien = bien.id_bien
	where date_mut between '2020-01-01' and '2020-03-31'
	group by nom),
-- table provisoire trimestre 2 --
trim2 as
	(select commune.id_commune, nom, count(*) as nbventes2 from commune
	inner join bien on bien.id_commune = commune.id_commune
	inner join vente on vente.id_bien = bien.id_bien
	where date_mut between '2020-04-01' and '2020-06-30'
	group by nom)

-- calcul du taux d'evolution des ventes par commune --    
select 	trim1.nom,
		nbventes2 as "nombre de ventes au 2e trimestre",
        nbventes1 as "nombre de ventes au 1er trimestre", 
        round((nbventes2 - nbventes1) * 100 / nbventes1) as evolution 
        from trim1
inner join trim2 on trim1.nom = trim2.nom
where round((nbventes2 - nbventes1) * 100 / nbventes1) >= 20;