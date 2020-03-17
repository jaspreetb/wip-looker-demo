view: wip_poi {
  sql_table_name: wip.wip_poi ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: cmaid {
    type: string
    sql: ${TABLE}.cmaid ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: daylight_saving_time_hr {
    type: number
    sql: ${TABLE}.daylight_saving_time_hr ;;
  }

  dimension: geometry_hash {
    type: number
    sql: ${TABLE}.geometry_hash ;;
  }

  dimension: group {
    type: string
    sql: ${TABLE}.``group`` ;;
  }

  dimension: lat_long {
    type: string
    sql: ${TABLE}.lat_long ;;
  }

  dimension: max_level {
    type: number
    sql: ${TABLE}.max_level ;;
  }

  dimension: min_level {
    type: number
    sql: ${TABLE}.min_level ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: standard_time_offset_hr {
    type: number
    sql: ${TABLE}.standard_time_offset_hr ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.verified ;;
  }

  dimension: vertices {
    type: string
    sql: ${TABLE}.vertices ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
