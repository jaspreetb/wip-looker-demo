view: wip_sales {
  sql_table_name: wip.wip_sales ;;

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

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
