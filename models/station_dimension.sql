with BIKE as (
    select 
    distinct
    start_statio_id AS station_id,
    start_station_name AS station_name,
    start_lat as station_lat,
    start_lng as station_ing

    from {{ ref('stg_bike') }}
    where ride_id != 'ride_id'
  
)

select *
from BIKE