view: wip_weather_by_day {
  sql_table_name: wip.wip_weather_by_day ;;

  dimension: condition_label {
    type: string
    sql: ${TABLE}.condition_label ;;
  }

  dimension: condition_value {
    type: number
    sql: ${TABLE}.condition_value ;;
  }

  dimension: poi_id {
    type: string
    sql: ${TABLE}.poi_id ;;
  }

  dimension_group: ts_local {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ts_local ;;
  }

  dimension_group: ts_utc {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ts_utc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
