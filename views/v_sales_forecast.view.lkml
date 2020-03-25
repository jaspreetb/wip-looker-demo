view: v_sales_forecast {
  derived_table: {
    sql: WITH sales_by_day AS (
  SELECT distinct product_id, date(ts_local) date, sum(value) total_value
  FROM `development-146318.wip.wip_business_metric_by_hour`
  group by product_id, date
),
historical AS (
  SELECT distinct s.product_id, date(f.ts_local) date, sum(total_value) historical_sales
  FROM `development-146318.wip.wip_forecast` f
    inner join sales_by_day s on s.product_id=f.product_id and DATETIME_ADD(cast(f.ts_local as datetime), interval -1 year)=cast(s.date as datetime)
  group by s.product_id, date
),
forecast AS (
  SELECT distinct product_id, date(ts_local) date, sum(predicted_value) predicted_value, sum(actual_sales) actual_sales
  FROM `development-146318.wip.wip_forecast`
  where disable_weather=false
  group by product_id, date
)
SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, timestamp(s.date) date,
  s.predicted_value, h.historical_sales, s.actual_sales
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
    sql: sum(${TABLE}.actual_sales) ;;

  }

  measure: average_predicted_value {
    type: number
    sql: avg(${TABLE}.predicted_value) ;;
  }

  measure: total_historical_sales {
    type: number
    sql: sum(${TABLE}.historical_sales) ;;
  }

  measure: sales_delta {
    type: number
    sql: sum(${TABLE}.predicted_value) - sum(${TABLE}.historical_sales) ;;
  }
}
