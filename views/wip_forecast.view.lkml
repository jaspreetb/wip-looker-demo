view: wip_forecast {
  sql_table_name: wip.wip_forecast ;;

  dimension: actual_sales {
    type: number
    sql: ${TABLE}.actual_sales ;;
  }

  dimension: disable_weather {
    type: yesno
    sql: ${TABLE}.disable_weather ;;
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

  measure: total_actual_sales {
    type: number
    sql: sum(${TABLE}.actual_sales) ;;
  }

  measure: total_predicted_sales {
    type: number
    sql: sum(${TABLE}.predicted_value) ;;
  }

}
