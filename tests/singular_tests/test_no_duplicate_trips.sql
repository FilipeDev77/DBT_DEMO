-- Test : Vérifier qu'il n'y a pas de trajets dupliqués
-- Échoue s'il y a des ride_id qui apparaissent plus d'une fois
-- Détecte les problèmes lors du nettoyage des données source

select ride_id, count(*) as occurrence_count
from {{ ref('trip_fact') }}
group by ride_id
having count(*) > 1
