view: v_geo_weather_impact {
  derived_table: {
    sql: WITH lk AS (
      select key, label from `development-146318.wip.wip_lk_top_variable`
      union all
      select 'rmse_historical_reduction' as key, 'rmse_historical_reduction' as label
    )
    SELECT distinct p.client_id, p.province, p.city,  p.label AS store, dim1 AS revenue_center, dim2 as item, p.lat, p.lon, extract(month from m.date) month, FORMAT_DATETIME("%b", datetime(m.date)) month_name, store_id, i.type meta_data_type, lk.label meta_data_key, i.value meta_data_value
FROM `development-146318.wip.wip_model_metadata_item` i
  inner join `development-146318.wip.wip_model_metadata` m on m.id=i.model_metadata_id
  inner join `development-146318.wip.wip_product` p on p.id=m.product_id
  inner join lk on lk.key=i.key
WHERE province is not null
             and {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %}
             and {% condition f_month %} extract(month from m.date) {% endcondition %}
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
    sql: ${TABLE}.month_name ;;
  }

  dimension: meta_data_type {
    type: string
    sql: ${TABLE}.meta_data_type ;;
  }

  dimension: meta_data_key {
    type: string
    sql: ${TABLE}.meta_data_key ;;
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

  dimension: meta_data_value {
    type: number
    sql: ${TABLE}.meta_data_value;;
  }

  dimension: store_id_ge_10_percent {
    type: number
    sql: case
      when ${TABLE}.meta_data_key = 'rmse_historical_reduction' and ${TABLE}.meta_data_value >= 0.1 then ${TABLE}.store_id else null end;;
  }

  dimension: store_id_ge_5_percent {
    type: number
    sql: case when ${TABLE}.meta_data_key = 'rmse_historical_reduction' and ${TABLE}.meta_data_value >= 0.05 then ${TABLE}.store_id else null end;;
  }

  measure: average_meta_data_value {
    label: "Weather Impact"
    type: number
    sql: avg(${TABLE}.meta_data_value);;
    value_format: "#,##0.00"
  }

  measure: average_rmse {
    label: "Weather Impact"
    type: number
    sql: avg(case when ${TABLE}.meta_data_key = 'rmse_historical_reduction' and ${TABLE}.meta_data_value >= 0.1 then ${TABLE}.meta_data_value else null end);;
    value_format: "0.00%"
  }

  measure: store_id_with_rmse {
    type: number
    sql: case when ${TABLE}.meta_data_key = 'rmse_historical_reduction' then ${TABLE}.store_id else null end;;
  }

  measure: store_percentage_ge_10 {
    type: number
    sql: count(${store_id_ge_10_percent}) / count(${store_id}) ;;
    value_format: "0.00%"
    html: <div>
            Weather Impact: {{average_rmse._rendered_value}}
          </div> ;;
  }

  measure: store_percentage_ge_5 {
    type: number
    sql: count(${store_id_ge_5_percent}) / count(${store_id}) ;;
    value_format: "0.00%"
  }

}
