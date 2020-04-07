view: v_market_index {
  sql_table_name: lzhang_dataset.market_index_visit_aggregation_20200406;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: poi_id {
    type: string
    sql: ${TABLE}.poi_id ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension: location {
    type: location
    sql_latitude:${TABLE}.lat ;;
    sql_longitude:${TABLE}.lon ;;
  }

  dimension: prov_code {
    sql: ${TABLE}.province ;;
    map_layer_name: canada_prov_layer
    drill_fields: [city_code]
  }

  dimension: city_code {
    sql: ${TABLE}.city;;
    map_layer_name: canada_city_layer
  }

  measure: total {
    type: number
    sql: sum(${TABLE}.total);;
  }

  measure: unique {
    type: number
    sql: sum(${TABLE}.unique);;
  }

}
