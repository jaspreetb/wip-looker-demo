view: v_market_index_pivot {
  derived_table: {
    sql: WITH avg AS (
            select province, city, category, avg(total) total, avg(unique) unique
            from `development-146318.lzhang_dataset.market_index_visit_aggregation_20200406`
            group by province, city, category
          )
          select v.day, v.province, v.city, v.category, sum(v.total) total, sum(v.unique) unique, sum(v.total)/avg.total total_ratio, sum(v.unique)/avg.unique unique_ratio
          from `development-146318.lzhang_dataset.market_index_visit_aggregation_20200406` v
            inner join avg using (province, city, category)
          group by v.day, v.province, v.city, v.category, avg.total, avg.unique;;
  }

  dimension: province {
    type: string
    sql: ${TABLE}.province ;;
    drill_fields: [city_code]
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }

  dimension: prov_code {
    sql: ${TABLE}.province ;;
    map_layer_name: canada_prov_layer
    drill_fields: [city_code]
  }

  dimension: city_code {
    sql: ${TABLE}.city;;
    map_layer_name: canada_city_layer
  }

  measure: qsr_total {
    type: number
    sql: sum(case when ${TABLE}.category='QSR' then ${TABLE}.total else null end);;
  }

  measure: qsr_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='QSR' then ${TABLE}.unique_ratio else null end) ;;
  }

  measure: malls_total {
    type: number
    sql: sum(case when ${TABLE}.category='MALLS' then ${TABLE}.total else null end);;
  }

  measure: malls_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='MALLS' then ${TABLE}.unique_ratio else null end) ;;
  }

  measure: groceries_total {
    type: number
    sql: sum(case when ${TABLE}.category='GROCERIES' then ${TABLE}.total else null end);;
  }

  measure: groceries_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='GROCERIES' then ${TABLE}.unique_ratio else null end) ;;
  }

  measure: gas_station_total {
    type: number
    sql: sum(case when ${TABLE}.category='GAS STATIONS' then ${TABLE}.total else null end);;
  }

  measure: gas_station_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='GAS STATIONS' then ${TABLE}.unique_ratio else null end) ;;
    }

  measure: bank_total {
    type: number
    sql: sum(case when ${TABLE}.category='FINANCIAL INSTITUTIONS' then ${TABLE}.total else null end);;
  }

  measure: bank_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='FINANCIAL INSTITUTIONS' then ${TABLE}.unique_ratio else null end) ;;
  }

  measure: pharmacy_total {
    type: number
    sql: sum(case when ${TABLE}.category='PHARMACIES & DRUG STORES' then ${TABLE}.total else null end);;
  }

  measure: pharmacy_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='PHARMACIES & DRUG STORES' then ${TABLE}.unique_ratio else null end) ;;
  }

  measure: liquor_total {
    type: number
    sql: sum(case when ${TABLE}.category='BEER, WINE & LIQUOR STORES' then ${TABLE}.total else null end);;
  }

  measure: liquor_ratio {
    type: number
    sql: avg(case when ${TABLE}.category='BEER, WINE & LIQUOR STORES' then ${TABLE}.unique_ratio else null end) ;;
  }
}
