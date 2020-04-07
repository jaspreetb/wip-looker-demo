view: v_visits_ooh {
  sql_table_name: wip.visits_cities_pattison;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: dst_offset {
    type: number
    sql: ${TABLE}.dst_offset ;;
  }

  dimension: group_ {
    type: string
    sql: ${TABLE}.group_ ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: new {
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
    sql: ${TABLE}.NewDate ;;
  }

  dimension: postalcode {
    type: string
    sql: ${TABLE}.postalcode ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension_group: sdate {
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
    sql: ${TABLE}.SDate ;;
  }

  dimension: v {
    type: string
    sql: ${TABLE}.v ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.x ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.y ;;
  }

  dimension: location {
    type: location
    sql_latitude:${TABLE}.y ;;
    sql_longitude:${TABLE}.x ;;
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

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: total {
    type: number
    sql: sum(${TABLE}.total) ;;
  }

  measure: unique {
    type: number
    sql: sum(${TABLE}.unique) ;;
  }

  measure: multiplier {
    type: number
    sql: ${TABLE}.multiplier ;;
  }


  measure: board_name {
    type: string
    sql: ${TABLE}.name ;;
  }

}
