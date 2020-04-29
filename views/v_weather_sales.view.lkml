view: v_weather_sales {
  derived_table: {
    sql: SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, s.ts_local AS date,
          w.condition_label, w.condition_value, s.value sales_value
        FROM `development-146318.wip.wip_business_metric_by_hour` s
          inner join `development-146318.wip.wip_product` p on s.product_id=p.id
          inner join `development-146318.wip.wip_weather_historical_fx_by_day` w on p.poi_id=w.poi_id and w.ts_local=s.ts_local
        where p.province is not null
             and {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %};;
  }

  filter: f_client_key {
    type: string
  }

  filter: f_province {
    type: string
  }

  filter: f_city {
    type: string
  }

  filter: f_revenue_center {
    type: string
  }

  filter: f_item {
    type:  string
  }

  filter: f_store_id {
    type:  string
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

  dimension: weather_condition {
    type:  string
    sql: ${TABLE}.condition_label ;;
  }

  dimension: weather_condition_label {
    type:  string
    sql: case when ${TABLE}.condition_label = 'temp' then 'Temperature'
        when  ${TABLE}.condition_label = 'precip' then 'Preciptation'
        when ${TABLE}.condition_label = 'relHum' then 'Humidity'
        when ${TABLE}.condition_label = 'windSpd' then 'Wind Speed'
        else ${TABLE}.condition_label end;;
  }

  measure: avg_weather_value {
    type: number
    sql: avg(${TABLE}.condition_value) ;;
    value_format: "$#,##0"
  }

  measure: total_sales {
    type: number
    sql: sum(${TABLE}.sales_value) ;;
    value_format: "$#,##0"
  }

  measure: daily_sales {
    type: number
    sql: avg(${TABLE}.sales_value) ;;
    value_format: "$#,##0"
  }
}
