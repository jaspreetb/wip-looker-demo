view: v_impact {
  derived_table: {
    sql: WITH with_weather AS (
          select
            product_id,
            timestamp(date(extract(year from ts_local), extract(month from ts_local),1)) month,
            SQRT(AVG((predicted_value-actual_value)*(predicted_value-actual_value))) rmse_historical
          from `development-146318.wip.wip_evaluation_set`
          where disable_weather=false
          group by product_id, month
        ),
        without_weather AS (
          select
            product_id,
            timestamp(date(extract(year from ts_local), extract(month from ts_local),1)) month,
            SQRT(AVG((predicted_value-actual_value)*(predicted_value-actual_value))) rmse_historical
          from `development-146318.wip.wip_evaluation_set`
          where disable_weather=true
          group by product_id, month
        )
        SELECT p.client_id, p.province, p.city,  p.label AS store, dim1 AS revenue_center, dim1_label revenue_center_name, dim2 as item, dim2_label as item_name, p.lat, p.lon, month, ((n.rmse_historical - w.rmse_historical) / n.rmse_historical) AS impact
        FROM with_weather w
          inner join without_weather n USING(product_id, month)
          inner join `development-146318.wip.wip_product` p on p.id=w.product_id
        where
             {% condition f_client_key %} p.client_key {% endcondition %}
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

  dimension: client_key {
    type: string
    sql: case when ${TABLE}.client_id='9001' then 'a51672f837ec11eaaec2-2e728ce88125' when ${TABLE}.client_id='0016' then '3962c805-c55f-4cc9-b999-474ceb322aa6' end;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
    drill_fields: [city,revenue_center,item]
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
    type: string
    sql: ${TABLE}.store ;;
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

  dimension: month {
    type: date
    sql: ${TABLE}.month ;;
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

  dimension: impact {
    type: number
    sql: ${TABLE}.impact ;;
  }

  measure: average_impact {
    type: number
    sql: avg(${TABLE}.impact);;
    value_format: "0.0%"
  }
}
