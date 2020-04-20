view: lip_ctc_drive_distance {
  sql_table_name: `development-146318.lzhang_dataset.lip_ctc_drive_distance`
    ;;

  dimension: metric_key {
    type: string
    sql: ${TABLE}.metric_key ;;
  }

  dimension: metric_type {
    type: string
    sql: ${TABLE}.metric_type ;;
  }

  measure: metric_value {
    type: number
    sql: sum(${TABLE}.metric_value) ;;
  }

  dimension: poi_drive_distance_code {
    type: string
    sql: ${TABLE}.poi_drive_distance_code ;;
  }

  dimension: poi_id {
    type: string
    sql: ${TABLE}.poi_id ;;
  }

  dimension: poi_label {
    type: string
    sql: ${TABLE}.poi_label ;;
  }

  dimension: poi_lat {
    type: number
    sql: ${TABLE}.poi_lat ;;
  }

  dimension: poi_lon {
    type: number
    sql: ${TABLE}.poi_lon ;;
  }

  dimension: location {
    type: location
    sql_latitude:${TABLE}.poi_lat ;;
    sql_longitude:${TABLE}.poi_lon ;;
  }

  dimension: drive_distance_code {
    sql: ${TABLE}.poi_drive_distance_code ;;
    map_layer_name: dirve_distance_layer
  }


}
