curl https://data.ny.gov/resource/vxuj-8kew.json | jq 'map({ster: .subways_total_estimated_ridership|tonumber, date: .date})'
