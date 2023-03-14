{{ config(materialized='table') }}

SELECT
  DATE_TRUNC(DATE(trip_start_timestamp), MONTH) AS trip_month,
  DATE_TRUNC(DATE(trip_start_timestamp), YEAR) AS trip_year,
  AVG(trip_miles) AS avg_trip_distance
FROM
  `turing-reach-379401.playground_iykra.taxi_trips`
GROUP BY
  trip_year,
  trip_month
