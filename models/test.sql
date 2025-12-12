select 
*
from __source{{source('demo','bike')}}

limit 10