view: v_geo_weather_impact {
  derived_table: {
    sql: SELECT p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, extract(month from m.date) month, i.value rmse_reduction
FROM `development-146318.wip.wip_model_metadata_item` i
  inner join `development-146318.wip.wip_model_metadata` m on m.id=i.model_metadata_id
  inner join `development-146318.wip.wip_product` p on p.id=m.product_id
where key='rmse_historical_reduction'
group by client_id, province, city, store_id, store, revenue_center, item, month, rmse_reduction
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

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  measure: rmse_reduction {
    type: number
    sql: ${TABLE}.rmse_reduction ;;
  }

  measure: average_rmse_reduction {
    type: number
    sql: abs(avg(${TABLE}.rmse_reduction)) ;;

  }
}