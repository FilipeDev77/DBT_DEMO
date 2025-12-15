# Tests DBT

Ce dossier contient tous les tests pour le projet dbt.

## Structure des tests

### 1. Tests génériques (`generic_tests.yml`)

Les tests génériques sont définis dans le fichier `generic_tests.yml` et incluent :

- **unique** : Vérifie qu'une colonne contient des valeurs uniques
- **not_null** : Vérifie qu'une colonne ne contient pas de valeurs NULL
- **accepted_values** : Vérifie que les valeurs d'une colonne font partie d'une liste prédéfinie
- **relationships** : Vérifie l'intégrité référentielle entre tables

**Exemple** :
```yaml
columns:
  - name: bike_id
    tests:
      - unique
      - not_null
```

### 2. Tests singuliers (`singular_tests/`)

Les tests singuliers sont des fichiers SQL personnalisés pour des validations métier spécifiques :

- `test_trip_duration_positive.sql` : Vérifie que les durées de trajets sont positives
- `test_station_count.sql` : Vérifie qu'il y a au minimum 5 stations
- `test_no_duplicate_trips.sql` : Vérifie qu'il n'y a pas de trajets dupliqués
- `test_weather_date_range.sql` : Vérifie que les dates météo sont réalistes

## Comment exécuter les tests

```bash
# Exécuter tous les tests
dbt test

# Exécuter les tests d'une table spécifique
dbt test --select trip_fact

# Exécuter les tests génériques uniquement
dbt test --select test_type:generic

# Exécuter les tests singuliers uniquement
dbt test --select test_type:singular

# Exécuter en affichant tous les détails
dbt test --store-failures

# Exécuter un test spécifique
dbt test --select test_trip_duration_positive
```

## Ajouter des tests personnalisés

### Ajouter un test générique simple :

Dans `generic_tests.yml`, ajoutez :
```yaml
- name: votre_model
  columns:
    - name: votre_colonne
      tests:
        - unique
        - not_null
```

### Ajouter un test singulier :

Créez un nouveau fichier dans `singular_tests/` :
```sql
-- tests/singular_tests/test_nom_du_test.sql
select *
from {{ ref('votre_model') }}
where condition_invalide = true
```

Le test échoue si des résultats sont retournés.

## Points importants

1. **Un test échoue s'il retourne des lignes** : Structurez vos tests SQL pour retourner uniquement les enregistrements problématiques
2. **Les tests s'exécutent après les modèles** : Utilisez `dbt build` pour construire et tester en même temps
3. **Les macro `ref()` et `source()`** : Utilisez-les pour référencer vos modèles et sources
4. **Déboguer les tests** : Utilisez `dbt test --store-failures` pour inspecter les résultats des tests échoués

