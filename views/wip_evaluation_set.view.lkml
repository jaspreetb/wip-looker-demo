view: wip_evaluation_set {
  sql_table_name: wip.wip_evaluation_set ;;

  dimension: actual_value {
    type: number
    sql: ${TABLE}.actual_value ;;
  }

  dimension: disable_weather {
    type: yesno
    sql: ${TABLE}.disable_weather ;;
  }

  dimension: past_weather_hour {
    type: number
    sql: ${TABLE}.past_weather_hour ;;
  }

  dimension: predicted_value {
    type: number
    sql: ${TABLE}.predicted_value ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
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
