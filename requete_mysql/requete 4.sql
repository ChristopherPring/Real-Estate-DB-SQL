-- calcul du prix moyen du m² en IdF --

select round(avg(val_fon / bien.surf_carrez),2) as "prix moyen du m² en IdF"
from vente
inner join bien on bien.id_bien = vente.id_bien
inner join commune on commune.id_commune = bien.id_commune
where dep in ('75', '77', '78', '91', '92', '93', '94', '95') 
and type_local = 'maison';