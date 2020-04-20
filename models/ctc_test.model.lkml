connection: "bigquery_wip"

# include all the views
include: "/views/lip_ctc_drive_distance.view"

# include: "/dashboards/**/*.dashboard"

datagroup: ctc_test_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

map_layer: dirve_distance_layer {
  file: "/data/ctc_drive_distance.topojson"
  property_key: "drive_distance_code"
}

persist_with: ctc_test_datagroup

explore: lip_ctc_drive_distance{}
