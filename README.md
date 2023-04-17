# Dimensional modelling
Taxi trips transformation using dbt

## Tech Stack
1. dbt
2. Google Cloud SDK
3. BigQuery

Ensure you’ve installed dbt core with BigQuery as the adapter (dbt-bigquery)

## Data
Taxi trip data can be accessed on the bigquery-public-data database and the chicago taxi trip dataset.

## Steps
1. Create new directory
2. Prepare a dbt project:
   - Start a dbt project with `dbt init`
   - Fill in the requested data as shown in the image, this time I named the project `dbt_with_bq`
      <img width="293" alt="Screenshot 2023-03-15 at 12 00 01" src="https://user-images.githubusercontent.com/113230789/225211373-cbcad5b1-497b-4d6d-b294-a5f6cdd8cc31.png">
3. Prepare dbt source (refer to schema.yml on staging folder)
   ```
   version: 2

    sources:
      - name: chicago_taxi_trips
        database: bigquery-public-data
        tables:
          - name: taxi_trips
   ```
4. Prepare dbt models (refer to the models folder)
5. Prepare macros to perform encoding (refer to macros folder)
6. Add tests to dbt models (refer to schema.yml on data warehouse folder)
7. Run the dbt project using `dbt run`

   (Notes: i get some error when perform 'dbt run' because there are some typo in my model, so make sure there is no typo in model or test)
   when dbt-run is successful it will be like this in terminal:
8. Check if a new data ware house has been created in BigQuery
9. Run `dbt docs generate`
10. Run `dbt docs serve`
    
