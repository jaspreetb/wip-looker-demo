view: v_evaluation_set {
  derived_table: {
    sql: WITH historical AS (
  SELECT distinct s.product_id, date(f.ts_local) date, sum(f.actual_value) historical_sales
  FROM `development-146318.wip.wip_evaluation_set` f
    inner join `development-146318.wip.wip_evaluation_set` s on s.product_id=f.product_id and DATETIME_ADD(cast(f.ts_local as datetime), interval -1 year)=cast(s.ts_local as datetime)
  group by s.product_id, date
),
forecast AS (
  SELECT distinct product_id, date(ts_local) date, sum(predicted_value) predicted_value, sum(actual_value) actual_value
  FROM `development-146318.wip.wip_evaluation_set`
  where disable_weather=false
  group by product_id, date
)
SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, timestamp(s.date) date,
  s.predicted_value, h.historical_sales, s.actual_value
FROM forecast s
  inner join `development-146318.wip.wip_product` p on s.product_id=p.id
  left join historical h on h.date=s.date and h.product_id=s.product_id
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

  measure: total_predicted_value {
    type: number
    sql: sum(${TABLE}.predicted_value) ;;
  }

  measure: total_actual_sales {
    type: number
    sql: sum(${TABLE}.actual_value) ;;

  }

  measure: total_historical_sales {
    type: number
    sql: sum(${TABLE}.historical_sales) ;;
  }

  measure: rmse_predict_actual {
    type: number
    sql: SQRT(AVG((${TABLE}.predicted_value-${TABLE}.actual_value)*(${TABLE}.predicted_value-${TABLE}.actual_value))) ;;
  }

  measure: rmse_historical_actual {
    type: number
    sql: SQRT(AVG((${TABLE}.historical_sales-${TABLE}.actual_value)*(${TABLE}.historical_sales-${TABLE}.actual_value))) ;;
  }

  measure: mae {
    type: number
    sql: AVG(ABS((${TABLE}.predicted_value-${TABLE}.actual_value))) ;;
  }
}
