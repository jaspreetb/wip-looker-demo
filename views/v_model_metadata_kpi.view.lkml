view: v_model_metadata_kpi {
  derived_table: {

    sql:with lk as (
      select key, label_en label
      from `development-146318.wip.wip_lk_weather`
      union all
      select ws_key key, label_en label
      from `development-146318.wip.wip_lk_weather`
    )
    SELECT distinct p.client_id, p.province, p.city, p.store_id, p.label AS store, dim1 AS revenue_center, dim2 as item, cast(m.date AS timestamp) date, i.type, i.key, lk.label AS key_label, i.value
FROM `development-146318.wip.wip_model_metadata` m
  inner join `development-146318.wip.wip_model_metadata_item` i on i.model_metadata_id=m.id
  inner join `development-146318.wip.wip_product` p on m.product_id=p.id
  inner join lk on lk.key=i.key
where p.province is not null
             and {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %}
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
    value_format: "0.00"
  }

  measure: average_value {
    label: " "
    type: number
    sql: avg(${TABLE}.value) ;;
    value_format: "0.00"
    html: <div>&nbsp;</div> ;;
  }
}
