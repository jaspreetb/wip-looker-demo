view: v_wip_time_range {
  derived_table: {
    sql: select client_id,
  max(fx_start) fx_start,
  max(fx_end) fx_end,
  max(sales_start) sales_start,
  max(sales_end) sales_end,
  max(evaluation_set_start) evaluation_set_start,
  max(evaluation_set_end) evaluation_set_end
from(
SELECT client_id, range_start fx_start, range_end fx_end , null sales_start, null sales_end, null evaluation_set_start, null evaluation_set_end
FROM `development-146318.wip.wip_time_range`
where type='forecast'
union all
SELECT client_id, null fx_start, null fx_end , range_start sales_start, range_end sales_end, null evaluation_set_start, null evaluation_set_end
FROM `development-146318.wip.wip_time_range`
where type='sales'
union all
SELECT client_id, null fx_start, null fx_end, null sales_start, null sales_end, range_start evaluation_set_start, range_end evaluation_set_end
FROM `development-146318.wip.wip_time_range`
where type='evaluation_set'
)group by client_id

 ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  measure: fx_start {
    type: date
    sql: ${TABLE}.fx_start ;;
  }

  measure: fx_end {
    type: date
    sql: ${TABLE}.fx_end ;;
  }

  measure: sales_start {
    type: date
    sql: ${TABLE}.sales_start ;;
  }

  measure: sales_end {
    type: date
    sql: ${TABLE}.sales_end ;;
  }

  measure: evaluation_set_start {
    type: date
    sql: ${TABLE}.evaluation_set_start ;;
  }

  measure: evaluation_set_end {
    type: date
    sql: ${TABLE}.evaluation_set_end ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
