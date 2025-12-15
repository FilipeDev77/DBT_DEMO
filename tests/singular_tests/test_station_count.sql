-- Test : Vérifier qu'il y a au moins 10 stations
-- Échoue si on détecte une anomalie dans les données de stations
-- Adapté au système réel de vélos

select count(*) as station_count
from {{ ref('station_dimension') }}
having count(*) < 10
