view: v_store {
  derived_table: {
    sql: SELECT distinct client_id, store_id, label AS store, province, city, label, lat, lon FROM `development-146318.wip.wip_product`;;
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
