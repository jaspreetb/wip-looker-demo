view: v_store {
  derived_table: {
    sql: SELECT distinct client_id, store_id, label AS store, province, city, label, lat, lon
        FROM `development-146318.wip.wip_product`
        WHERE
             {% condition f_client_key %} client_key {% endcondition %}
             and {% condition f_province %} province {% endcondition %}
             and {% condition f_city %} city {% endcondition %}
             and {% condition f_revenue_center %} dim1 {% endcondition %}
             and {% condition f_item %} dim2 {% endcondition %}
             and {% condition f_store_id %} store_id {% endcondition %};;
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

  dimension: store_id {
    type: string
    sql: ${TABLE}.store_id ;;
  }

  dimension: store {
    type: string
    sql: ${TABLE}.store ;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: label {
    label: "Address:"
    type: string
    sql: ${TABLE}.label ;;
    html: <div style="width:200px; float:left;">{{label}}</div>
      <a type="button" target="_self"  href="/dashboards/49?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/dashboards/49?store_id=">Remove Store</a>;;
  }

  set: drill_fields {
    fields: [label]
  }

  dimension: location {
    type: location
    sql_latitude:${TABLE}.lat ;;
    sql_longitude:${TABLE}.lon ;;
  }

}
