-- Test : Vérifier que les dates météo ne contiennent pas de données invalides
-- Échoue si une date est supérieure à aujourd'hui (pas de prédictions)
-- Détecte les erreurs dans la transformation des timestamps

select *
from {{ ref('daily_weather') }}
where daily_weather > current_date
