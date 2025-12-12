with BIKE as (
    select 
    distinct
    start_station_id AS station_id,
    start_station_name AS station_name,
    start_lat as station_lat,
    start_ing as station_ing

    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
  
)

select *
from BIKE