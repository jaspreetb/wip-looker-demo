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
SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim1_label revenue_center_name, dim2 as item, dim2_label item_name, timestamp(s.date) date,
  s.predicted_value, h.historical_sales, s.actual_value, p.lat, p.lon,
FROM forecast s
  inner join `development-146318.wip.wip_product` p on s.product_id=p.id
  left join historical h on h.date=s.date and h.product_id=s.product_id
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

  dimension: label {
    label: "Address:"
    type: string
    sql: ${TABLE}.store ;;
    html: <div style="width:200px; float:left;">{{store}}</div>
      <a type="button" target="_self"  href="/dashboards/48?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/dashboards/48?store_id=">Remove Store</a>;;
  }

  dimension: embed_label {
    label: "Store:"
    type: string
    sql: ${TABLE}.store ;;
    html: <div style="width:200px; float:left;">{{store}}</div>
      <a type="button" target="_self"  href="/embed/dashboards/48?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/embed/dashboards/48?store_id=">Remove Store</a>;;
  }

  dimension: revenue_center {
    type: string
    sql: ${TABLE}.revenue_center ;;
  }

  dimension: revenue_center_name {
    type: string
    sql: ${TABLE}.revenue_center_name ;;
  }

  dimension: item {
    type: string
    sql: ${TABLE}.item ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: location {
    type: location
    sql_latitude:${TABLE}.lat ;;
    sql_longitude:${TABLE}.lon ;;
  }

  measure: total_predicted_value {
    type: number
    sql: sum(${TABLE}.predicted_value) ;;
  }

  measure: total_actual_sales {
    type: number
    sql: sum(${TABLE}.actual_value) ;;
    value_format: "$#,##0"
  }

  measure: total_historical_sales {
    type: number
    sql: sum(${TABLE}.historical_sales) ;;
    value_format: "$#,##0"
  }

  measure: rmse_predict_actual {
    type: number
    sql: SQRT(AVG((${TABLE}.predicted_value-${TABLE}.actual_value)*(${TABLE}.predicted_value-${TABLE}.actual_value))) ;;
    value_format: "$#,##0"
  }

  measure: rmse_historical_actual {
    type: number
    sql: SQRT(AVG((${TABLE}.historical_sales-${TABLE}.actual_value)*(${TABLE}.historical_sales-${TABLE}.actual_value))) ;;
    value_format: "$#,##0"
  }

  measure: mae {
    type: number
    sql: AVG(ABS((${TABLE}.predicted_value-${TABLE}.actual_value))) ;;
    value_format: "$#,##0"
  }
}
