# Lets massage the data a little by just extracting `subways_total_estimated_ridership`
curl https://data.ny.gov/resource/vxuj-8kew.json | jq 'map({ster: .subways_total_estimated_ridership|tonumber, date: .date|rtrimstr("0")})'
