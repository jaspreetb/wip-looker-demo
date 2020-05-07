view: v_geo_weather_impact {
  derived_table: {
    sql: WITH lk AS (
      select key, label_en label from `development-146318.wip.wip_lk_weather`
      union all
      select 'rmse_historical_reduction' as key, 'rmse_historical_reduction' as label
    )
    SELECT distinct p.client_id, p.province, p.city,  p.label AS store, dim1 AS revenue_center, dim2 as item, p.lat, p.lon, extract(month from m.date) month, FORMAT_DATETIME("%b", datetime(m.date)) month_name, store_id, i.type meta_data_type, lk.label meta_data_key, i.value meta_data_value,
    avg(case when lk.key='rmse_historical_reduction' then i.value end) over (partition by store_id, extract(month from m.date)) avg_rmse_store
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
            {% if v_geo_weather_impact.f_item._in_query %}
            and p.dim2 is not null and p.dim1 is null
            {% else %}
            and p.dim1 is not null and p.dim2 is null
            {% endif %}
group by client_id, province, city, store, revenue_center, item, lat, lon, month, month_name, store_id, meta_data_type, meta_data_key, meta_data_value, lk.key,m.date
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
  }

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: avg_rmse_store {
    type: string
    sql: ${TABLE}.avg_rmse_store ;;
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
    sql: case when ${TABLE}.revenue_center is not null then ${TABLE}.revenue_center else '' end;;
    #drill_fields: [city]
  }

  dimension: item {
    type: string
    sql: case when ${TABLE}.item is not null then ${TABLE}.item else '' end;;
    #drill_fields: [city]
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: month_name {
    type: string
    sql: ${TABLE}.month_name ;;
    drill_fields: [city]
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

  dimension: revenue_center_ge_10_percent {
    type: number
    sql: case when ${TABLE}.meta_data_key = 'rmse_historical_reduction' and ${TABLE}.meta_data_value >= 0.1 then ${TABLE}.revenue_center else null end;;
  }

  dimension: item_ge_10_percent {
    type: number
    sql: case when ${TABLE}.meta_data_key = 'rmse_historical_reduction' and ${TABLE}.meta_data_value >= 0.1 then ${TABLE}.item else null end;;
  }

  measure: average_meta_data_value {
    label: "Other Weather Impact"
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
    sql: {% if v_geo_weather_impact.f_item._in_query %}
        SAFE_DIVIDE(count(${item_ge_10_percent}),count(${item}))
        {% else %}
        SAFE_DIVIDE(count(${revenue_center_ge_10_percent}), count(${revenue_center}))
        {% endif %};;
    value_format: "0.00%"
    html: <div>
            Weather Impact: {{average_rmse._rendered_value}}
          </div> ;;
  }
}
