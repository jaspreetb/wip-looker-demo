view: v_rmse_deduction_by_store {
  derived_table: {
    sql: WITH monthly AS (
  SELECT p.province, p.city,  p.label AS store, dim1 AS revenue_center, dim2 as item, p.lat, p.lon, store_id,
    disable_weather, EXTRACT(month from date(ts_local)) month, sum(predicted_value) predicted_value, sum(actual_value) actual_value
  FROM `development-146318.wip.wip_evaluation_set` e
    inner join `development-146318.wip.wip_product` p on p.id=e.product_id
  WHERE {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %}
             and {% condition f_month %} extract(month from ts_local) {% endcondition %}
  group by province, city,store, revenue_center, item, lat, lon, store_id, month, disable_weather
),
monthly_mse as (
  select province, city,store, revenue_center, item, lat, lon, store_id, disable_weather, month,
    case when disable_weather=true then avg((predicted_value-actual_value)*(predicted_value-actual_value)) over (partition by store_id, disable_weather, month) end mse_without_weather,
    case when disable_weather=false then avg((predicted_value-actual_value)*(predicted_value-actual_value)) over (partition by store_id, disable_weather, month) end mse_with_weather
  from monthly
  group by province, city,store, revenue_center, item, lat, lon, store_id, disable_weather, month, predicted_value, actual_value
)
select province, city,store, revenue_center, item, lat, lon, store_id, month,
  avg(mse_without_weather) over (partition by store_id,month order by 1) - avg(mse_with_weather) over (partition by store_id,month order by 1) rmse_deduction
from monthly_mse
group by province, city,store, revenue_center, item, lat, lon, store_id, month, mse_without_weather, mse_with_weather
;;
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

  filter: f_month {
    type:  number
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
    link: {
      label: "by Province by City"
      url:"/looks/31?&f[province]={{ value }}"
    }
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [revenue_center, item]
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store {
    label: "Address:"
    type: string
    sql: ${TABLE}.store ;;
    html: <div style="width:200px; float:left;">{{store}}</div><br/>;;
  }

  dimension: store_ge_10 {
    type: string
    sql: case when ${TABLE}.rmse_deduction >= 0.1 then  ${TABLE}.store_id end ;;
  }

  dimension: label {
    label: "Address:"
    type: string
    sql: ${TABLE}.store ;;
    html: <div style="width:200px; float:left;">{{store}}</div>
      <a type="button" target="_self"  href="/dashboards/47?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/dashboards/47?store_id=">Remove Store</a>;;
  }

  dimension: embed_label {
    label: "Store:"
    type: string
    sql: ${TABLE}.store ;;
    html: <div style="width:200px; float:left;">{{store}}</div>
      <a type="button" target="_self"  href="/embed/dashboards/47?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/embed/dashboards/47?store_id=">Remove Store</a>;;
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

  dimension: month_name {
    type: string
    sql: ${TABLE}.month ;;
    value_format: "%b"
  }

  dimension: rmse_deduction {
    type: number
    sql: ${TABLE}.rmse_deduction ;;
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

  measure: store_percentage_ge_10 {
    type: number
    sql: count(${store_ge_10}) / count(${store_id}) ;;
    value_format: "0.00%"
    html: <div>
            Weather Impact: {{rmse_deduction._rendered_value}}
          </div> ;;
  }


}
