-- Test : Vérifier que la durée des trajets est positive (en secondes)
-- Échoue si une durée négative ou nulle est trouvée
-- Les trajets invalides indiquent une erreur dans les données source

select *
from {{ ref('trip_fact') }}
where trip_duration_seconds <= 0
