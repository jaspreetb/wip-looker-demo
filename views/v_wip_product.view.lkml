view: v_wip_product {
  sql_table_name: `development-146318.wip.wip_product`
    ;;
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

  dimension: dim1_label {
    type: string
    sql: ${TABLE}.dim1_label ;;
  }

  dimension: dim2 {
    type: string
    sql: ${TABLE}.dim2 ;;
  }

  dimension: dim2_label {
    type: string
    sql: ${TABLE}.dim2_label ;;
  }

  dimension: dim3 {
    type: string
    sql: ${TABLE}.dim3 ;;
  }

  dimension: dim3_label {
    type: string
    sql: ${TABLE}.dim3_label ;;
  }

  dimension: dim4 {
    type: string
    sql: ${TABLE}.dim4 ;;
  }

  dimension: dim4_label {
    type: string
    sql: ${TABLE}.dim4_label ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
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

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
