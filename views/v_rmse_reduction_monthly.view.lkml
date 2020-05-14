view: v_rmse_reduction_monthly {
  derived_table: {
    sql: WITH daily AS (
  SELECT p.id product_id, p.province, p.city,  p.label AS store, dim1 AS revenue_center, dim2 as item, p.lat, p.lon, store_id, timestamp(date(ts_local)) day,
    sum(case when disable_weather=true then predicted_value end) predicted_value_no_weather,
    sum(case when disable_weather=true then actual_value end) actual_value_no_weather,
    sum(case when disable_weather=false then predicted_value end) predicted_value_weather,
    sum(case when disable_weather=false then actual_value end) actual_value_weather
  FROM `development-146318.wip.wip_evaluation_set` e
    inner join `development-146318.wip.wip_product` p on p.id=e.product_id
  WHERE {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %}
             and {% condition f_month %} extract(month from ts_local) {% endcondition %}
            {% if v_rmse_reduction_monthly.f_item._in_query %}
            and p.dim1 is null and p.dim2 is not null
            {% else %}
            and p.dim1 is not null and p.dim2 is null
            {% endif %}
  group by product_id, province, city,store, revenue_center, item, lat, lon, store_id, day
)
select product_id, province, city,store, revenue_center, item, lat, lon, store_id,  EXTRACT(month from date(day)) month, FORMAT_DATETIME("%b", datetime(day)) month_name,
  (sqrt(avg((predicted_value_no_weather-actual_value_no_weather)*(predicted_value_no_weather-actual_value_no_weather)))-sqrt(avg((predicted_value_weather-actual_value_weather)*(predicted_value_weather-actual_value_weather))))/sqrt(avg((predicted_value_no_weather-actual_value_no_weather)*(predicted_value_no_weather-actual_value_no_weather))) rmse_reduction
from daily
group by product_id, province, city,store, revenue_center, item, lat, lon, store_id, month, month_name;;
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
    link: {
      label: "Select Store"
      url: "/embed/dashboards/47?store_id={{store_id}}"
    }
  }

  dimension: label {
    label: "Address:"
    type: string
    sql: ${TABLE}.store ;;
    link: {
      label: "Select Store"
      url: "/embed/dashboards/47?store_id={{store_id}}"
    }
  }

  dimension: embed_label {
    label: "Store:"
    type: string
    sql: ${TABLE}.store ;;
    link: {
      label: "Select Store"
      url: "/embed/dashboards/47?store_id={{store_id}}"
    }
  }

  dimension: revenue_center {
    type: string
    sql: case when ${TABLE}.revenue_center is not null then ${TABLE}.revenue_center else '' end ;;
    }

  dimension: item {
    type: string
    sql: case when ${TABLE}.item is not null then ${TABLE}.item else '' end ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
    link: {
      label: "Select Store"
      url: "/embed/dashboards/54?month_name={{value}}&client_key={{ _filters['f_client_key'] | url_encode }}&province={{ _filters['f_province'] | url_encode }}&city={{ _filters['f_city'] | url_encode }}&store_id={{ _filters['f_store_id'] | url_encode }}&weather_type={{ _filters['f_weather_type'] | url_encode }}"
    }
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

  measure: avg_rmse_reduction {
    type: number
    sql: avg(case when ${TABLE}.rmse_reduction >= 0.1 then ${TABLE}.rmse_reduction else null end);;
    value_format: "0.00%"
  }

  measure: count_rmse_ge_10_per {
    type: number
    sql: count(case when ${TABLE}.rmse_reduction >= 0.1 then ${TABLE}.store_id else null end);;
  }

  measure: count {
    type: number
    sql: count(${TABLE}.product_id);;
  }

  measure: store_percentage_ge_10 {
    type: number
    sql: SAFE_DIVIDE(count(distinct case when ${TABLE}.rmse_reduction >= 0.1 then ${TABLE}.store_id else null end), count(distinct ${TABLE}.store_id)) ;;
    value_format: "0.00%"
    html: <div>
            Percentage: {{store_percentage_ge_10._rendered_value}}
            <br/>
            Average Weather Impact: {{avg_rmse_reduction._rendered_value}}
          </div> ;;
  }
}
