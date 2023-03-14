{{ config(materialized='table') }}

WITH
  date_range AS (
    SELECT
      MIN(DATE(trip_start_timestamp)) AS min_date,
      MAX(DATE(trip_start_timestamp)) AS max_date
    FROM
       `turing-reach-379401.playground_iykra.taxi_trips`
       ) 
  ,
  date_list AS (
    SELECT
      DATE_ADD(min_date, INTERVAL day_offset DAY) AS date
    FROM
      date_range,
      UNNEST(GENERATE_ARRAY(0, DATE_DIFF(max_date, min_date, DAY))) AS day_offset
  )
SELECT
  FORMAT_DATE('%Y%m%d', date) AS date_id,
  date,
  EXTRACT(YEAR FROM date) AS year,
  EXTRACT(MONTH FROM date) AS month,
  EXTRACT(DAY FROM date) AS day,
  FORMAT_DATE('%A', date) AS day_of_week
FROM
  date_list
