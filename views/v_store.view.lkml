view: v_store {
  derived_table: {
    sql: SELECT distinct p.client_id, p.store_id, p.label AS store, p.province, p.city, p.label, p.lat, p.lon
        FROM `development-146318.wip.wip_product` p
        WHERE
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
      <br/>
      <a type="button" target="_self"  href="/dashboards/49?store_id={{store_id}}">Select Store</a>
      <br/>
      <a type="button" target="_self"  href="/dashboards/49?store_id=">Remove Store</a>;;
  }

  dimension: embed_label_49 {
    label: "Store:"
    type: string
    sql: ${TABLE}.label ;;
    link: {
      label: "Select Store"
      url: "/embed/dashboards/49?store_id={{store_id}}"
    }
  }

  dimension: embed_label_50 {
    label: "Store:"
    type: string
    sql: ${TABLE}.label ;;
    link: {
      label: "Select Store"
      url: "/embed/dashboards/50?store_id={{store_id}}"
    }
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
