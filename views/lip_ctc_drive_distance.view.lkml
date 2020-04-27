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

  dimension: drive_time_m_raw {
    type: number
    sql: ${TABLE}.drive_time_m ;;
    value_format: "0"
  }

  dimension: poi_drive_distance_code {
    type: string
    sql: concat(${TABLE}.poi_id, '_', ${TABLE}.drive_time_m) ;;
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

  dimension: store {
    label: "Store Address:"
    type: string
    sql: ${TABLE}.poi_label ;;
    html: <div style="width:200px; float:left;">{{poi_label}}</div>
      Drive Time: <br/>
      <a type="button" target="_self"  href="/dashboards/51?POI={{poi_id}}&Drive=5">5 minutes</a>
      <br/>
      <a type="button" target="_self"  href="/dashboards/51?POI={{poi_id}}&Drive=10">10 minutes</a>;;
  }

  set: drill_fields {
    fields: [store]
  }

  dimension: drive_distance_code {
    sql: concat(${TABLE}.poi_id, '_', ${TABLE}.drive_time_m) ;;
    map_layer_name: dirve_distance_layer
  }

  dimension: drive_time_m {
    label: "Drive Time: "
    type: number
    sql: ${TABLE}.drive_time_m ;;
    html: <div style="width:150px">{{drive_time_m_raw}} minutes</div>;;
  }

  measure: metric_value {
    type: number
    sql: sum(${TABLE}.metric_value) ;;
  }

  measure: metric_sequence {
    type: number
    sql: sum(${TABLE}.metric_sequence) ;;
  }

}
