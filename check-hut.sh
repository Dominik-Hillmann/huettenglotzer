#!/bin/sh

NTFY_TOPIC="bedfreealps"

current_status=$(curl \
  -X GET "https://www.hut-reservation.org/api/v1/reservation/getHutAvailability?hutId=195" \
  -H "Accept: application/json")

day_status=$(echo "$current_status"  | jq '.[] | select(.date == "2025-08-04T00:00:00Z")')
echo "$day_status"
num_free_beds=$(echo "$day_status" | jq --raw-output '.freeBeds')

echo "Number of free beds: $num_free_beds"

if [ "$num_free_beds" -gt 1 ]; then
  curl \
    -H "Title: Check for free beds" \
    -H "Tags: exclamation" \
    -H "Priority: high" \
    -d "There are now $num_free_beds beds available at the hut." \
    ntfy.sh/$NTFY_TOPIC
else
  curl \
    -H "Title: Check for free beds" \
    -H "Tags: sleeping_bed" \
    -H "Priority: min" \
    -d "Currently no beds available." \
    ntfy.sh/$NTFY_TOPIC
fi
