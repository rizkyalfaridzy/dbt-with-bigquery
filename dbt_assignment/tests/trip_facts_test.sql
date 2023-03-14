
{{ config(materialized='view') }}

SELECT COUNT(*) AS num_rows FROM {{ ref('trip_facts') }}

SELECT COUNT(DISTINCT unique_key) AS num_unique_keys FROM {{ ref('trip_facts') }}

# company_dim_test.sql
{{ config(materialized='view') }}

SELECT COUNT(*) AS num_rows FROM {{ ref('company_dim') }}

SELECT COUNT(DISTINCT company_id) AS num_unique_ids FROM {{ ref('company_dim') }}

# date_dim_test.sql
{{ config(materialized='view') }}

SELECT COUNT(*) AS num_rows FROM {{ ref('date_dim') }}

SELECT COUNT(DISTINCT date_id) AS num_unique_ids FROM {{ ref('date_dim') }}
