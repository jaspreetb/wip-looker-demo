connection: "bigquery_wip"

# include all the views
include: "/views/**/v_*.view"

include: "/dashboards/**/*.dashboard"

datagroup: wip_poc_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

map_layer: canada_prov_layer {
  file: "/data/canada_prov.topojson"
  property_key: "prov_code"
}

map_layer: canada_city_layer {
  file: "/data/canada_city.topojson"
  property_key: "city_code"
}

persist_with: wip_poc_default_datagroup

explore: v_wip_client {}

explore: v_model_metadata_kpi{}

explore: v_model_performance {}

explore: v_sales_forecast {}

explore: v_evaluation_set {}

explore: v_store {}

explore: v_geo_weather_impact {}

explore: v_weather_sales {}

explore: v_impact {}

explore: v_weather_month_correlation {}

explore: v_visits_ooh {}

explore: v_market_index {}

explore: v_market_index_pivot {}

explore: v_wip_product {}

explore: v_wip_time_range {}
