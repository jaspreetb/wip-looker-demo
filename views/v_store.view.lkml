view: v_store {
  derived_table: {
    sql: SELECT distinct client_id, store_id, province, city, label, lat, lon FROM `development-146318.wip.wip_product`;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  measure: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  measure: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

}
