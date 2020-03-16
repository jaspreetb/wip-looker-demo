view: wip_weather_historical_fx_by_hr {
  sql_table_name: wip.wip_weather_historical_fx_by_hr ;;

  dimension: condition_label {
    type: string
    sql: ${TABLE}.condition_label ;;
  }

  dimension: condition_value {
    type: number
    sql: ${TABLE}.condition_value ;;
  }

  dimension_group: end_dt {
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
    sql: CAST(${TABLE}.end_dt AS TIMESTAMP) ;;
  }

  dimension_group: end_utc {
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
    sql: ${TABLE}.end_utc ;;
  }

  dimension: poi_id {
    type: string
    sql: ${TABLE}.poi_id ;;
  }

  dimension_group: start_dt {
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
    sql: CAST(${TABLE}.start_dt AS TIMESTAMP) ;;
  }

  dimension_group: start_utc {
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
    sql: ${TABLE}.start_utc ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
