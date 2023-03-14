
{{{{ config(materialized='table') }}

SELECT
  unique_key,
  trip_start_timestamp,
  trip_end_timestamp,
  trip_seconds,
  trip_miles,
  fare,
  tips,
  companies.company_id,
  dates.date_id
FROM
  {{ ref('turing-reach-379401`.`playground_iykra`.`taxi_trips') }} trips
JOIN
  {{ ref('company_dim') }} companies
ON
  trips.company = companies.company_name
JOIN
  {{ ref('date_dim') }} dates
ON
  DATE(trips.trip_start_timestamp) = dates.date}}
