view: wip_model_metadata_kpi {
  derived_table: {
    sql: SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, cast(m.date AS timestamp) date, i.type, i.key, i.value
        FROM `development-146318.wip.wip_model_metadata` m
          inner join `development-146318.wip.wip_model_metadata_item` i on i.model_metadata_id=m.id
          inner join `development-146318.wip.wip_product` p on m.product_id=p.id
        where p.province is not null;;
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  measure: total_value {
    type: number
    sql: sum(${TABLE}.value) ;;
  }
}