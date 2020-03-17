view: v_model_performance {
  derived_table: {
    sql: SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, s.ts_local AS date,
        actual_value, s.predicted_value
        FROM `development-146318.wip.wip_evaluation_set` s
          inner join `development-146318.wip.wip_product` p on s.product_id=p.id
        where p.province is not null
;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: revenue_center {
    type: string
    sql: ${TABLE}.revenue_center ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  measure: total_actual_value {
    type: number
    sql: sum(${TABLE}.actual_value) ;;
  }

  measure: total_predicted_value {
    type: number
    sql: sum(${TABLE}.predicted_value) ;;
  }
}
