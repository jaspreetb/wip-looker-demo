connection: "bigquery_wip"

# include all the views
include: "/views/**/*.view"

include: "/*.dashboard.lookml"

datagroup: lana_test_wip_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: lana_test_wip_default_datagroup

explore: wip_client {}

explore: wip_evaluation_set {}

explore: wip_forecast {}

explore: wip_model_metadata {}

explore: wip_model_metadata_item {}

explore: wip_poi {}

explore: wip_product {}

explore: wip_sales {}

explore: wip_weather_by_day {}

explore: wip_weather_by_hr {}

explore: wip_weather_historical_fx_by_day {}

explore: wip_weather_historical_fx_by_hr {}

explore: wip_weather_sales {}

explore: wip_sales_prediction{}

explore: wip_sales_forecast {}

explore: wip_model_metadata_kpi {}
