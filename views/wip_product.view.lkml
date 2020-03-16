view: wip_product {
  sql_table_name: wip.wip_product ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: dim1 {
    type: string
    sql: ${TABLE}.dim1 ;;
  }

  dimension: dim2 {
    type: string
    sql: ${TABLE}.dim2 ;;
  }

  dimension: dim3 {
    type: string
    sql: ${TABLE}.dim3 ;;
  }

  dimension: dim4 {
    type: string
    sql: ${TABLE}.dim4 ;;
  }

  dimension: poi_id {
    type: string
    sql: ${TABLE}.poi_id ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
