view: v_model_metadata_kpi {
  derived_table: {

    sql: WITH lk_meta AS (
  select 'temp' as key, 'Temperature' as label union all
  select 'presTend' as key, 'Pressure Tendency' as label union all
  select 'relHum' as key, 'Relative Humidity' as label union all
  select 'radSolar' as key, 'Clear and Sunny' as label union all
  select 'snowfall' as key, 'Snowfall' as label union all
  select 'windDir80m' as key, 'Wind Direction' as label union all
  select 'windSpd80m' as key, 'Wind Speed' as label union all
  select 'cldCvr' as key, 'Cloud Coverage' as label union all
  select 'dewPt' as key, 'Dew Point' as label union all
  select 'mslPres' as key, 'Mean Sea Level Pressure' as label union all
  select 'spcHum' as key, 'Specific Humidty' as label union all
  select 'rainfall_LIGHT' as key, 'Light Rainfall' as label union all
  select 'rainfall_MEDIUM' as key, 'Medium Rainfall' as label union all
  select 'rainfall_HEAVY' as key, 'Heavy Rainfall' as label union all
  select 'mean_avgtemp_past_7days' as key, 'Average Temperature For The Past Week' as label
)
SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, cast(m.date AS timestamp) date, i.type, i.key, lk.label AS key_label, i.value
FROM `development-146318.wip.wip_model_metadata` m
  inner join `development-146318.wip.wip_model_metadata_item` i on i.model_metadata_id=m.id
  inner join `development-146318.wip.wip_product` p on m.product_id=p.id
  inner join lk_meta lk on lk.key=i.key
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

  dimension: key_label {
    type: string
    sql: ${TABLE}.key_label ;;
  }

  measure: total_value {
    type: number
    sql: sum(${TABLE}.value) ;;
  }

  measure: average_value {
    type: number
    sql: avg(${TABLE}.value) ;;
  }
}
