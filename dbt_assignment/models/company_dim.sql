{{ config(materialized='table') }}

SELECT
  ROW_NUMBER() OVER () AS company_id,
  company
FROM
  'turing-reach-379401`.`playground_iykra`.`taxi_trips'
GROUP BY
  company
