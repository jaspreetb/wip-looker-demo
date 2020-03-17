connection: "bigquery_wip"

# include all the views
include: "/views/**/*.view"

datagroup: wip_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: wip_poc_default_datagroup

explore: wip_client {}

explore: wip_evaluation_set {}

explore: wip_forecast {}

explore: wip_model_metadata {}

explore: wip_model_metadata_item {}

explore: wip_poi {}

explore: wip_product {}

explore: wip_sales {}

explore: wip_time_range {}

explore: wip_weather_by_day {}

explore: wip_weather_by_hr {}

explore: wip_weather_historical_fx_by_day {}

explore: wip_weather_historical_fx_by_hr {}

explore: v_model_metadata_kpi{}

explore: v_model_performance {}

explore: v_sales_forecast {}

explore: v_weather_sales {}
