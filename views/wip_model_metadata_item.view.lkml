view: wip_model_metadata_item {
  sql_table_name: wip.wip_model_metadata_item ;;

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }

  dimension: model_metadata_id {
    type: string
    sql: ${TABLE}.model_metadata_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
