view: v_weather_month_correlation {
    derived_table: {
      sql:WITH sales AS (
            SELECT p.client_id, p.poi_id, date(s.ts_local) date, sum(s.value) total_sales
            FROM `wip.wip_business_metric_by_hour` s
                inner join `wip.wip_product` p on s.product_id=p.id
                inner join `wip.wip_evaluation_set` e on e.product_id=s.product_id
            where
             {% condition f_client_key %} p.client_key {% endcondition %}
             and {% condition f_province %} p.province {% endcondition %}
             and {% condition f_city %} p.city {% endcondition %}
             and {% condition f_revenue_center %} p.dim1 {% endcondition %}
             and {% condition f_item %} p.dim2 {% endcondition %}
             and {% condition f_store_id %} p.store_id {% endcondition %}
            group by client_id, poi_id, date
        ),
        dims AS (
          SELECT
              s.client_id,
              EXTRACT(MONTH FROM s.date) AS month,
              format_date('%b', s.date) month_label,
              lk.label condition_label,
              ROUND(CORR(s.total_sales, w.condition_value),2) correlation, avg(w.condition_value) correlation_value
          FROM sales s
              inner join `wip.wip_weather_historical_fx_by_day` w on s.date=date(w.ts_local) and s.poi_id=w.poi_id
              inner join `wip.wip_lk_top_variable` lk on lk.key=w.condition_label
          group by client_id, month, month_label, condition_label
        )
        select
          client_id,
          condition_label,
          ifnull(AVG(IF(month=1, correlation, null)),0) Jan,
          ifnull(AVG(IF(month=2, correlation, null)),0) Feb,
          ifnull(AVG(IF(month=3, correlation, null)),0) Mar,
          ifnull(AVG(IF(month=4, correlation, null)),0) Apr,
          ifnull(AVG(IF(month=5, correlation, null)),0) May,
          ifnull(AVG(IF(month=6, correlation, null)),0) Jun,
          ifnull(AVG(IF(month=7, correlation, null)),0) Jul,
          ifnull(AVG(IF(month=8, correlation, null)),0) Aug,
          ifnull(AVG(IF(month=9, correlation, null)),0) Sep,
          ifnull(AVG(IF(month=10, correlation, null)),0) Oct,
          ifnull(AVG(IF(month=11, correlation, null)),0) Nov,
          ifnull(AVG(IF(month=12, correlation, null)),0) Dec
        from dims
        group by client_id, condition_label;;
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

    dimension: condition_label {
      type: string
      sql: ${TABLE}.condition_label ;;
    }

    dimension: Jan {
      type: number
      sql: if(IS_NAN(${TABLE}.jan), null, (${TABLE}.jan));;
      value_format: "0.00"
    }

    dimension: Feb {
      type: number
      sql: if(IS_NAN(${TABLE}.feb), null, (${TABLE}.feb));;
      value_format: "0.00"
    }

    dimension: Mar {
      type: number
      sql: if(IS_NAN(${TABLE}.mar), null, (${TABLE}.mar));;
      value_format: "0.00"
    }

    dimension: Apr {
      type: number
      sql: if(IS_NAN(${TABLE}.apr), null, (${TABLE}.apr));;
      value_format: "0.00"
    }

    dimension: May {
      type: number
      sql: if(IS_NAN(${TABLE}.may), null, (${TABLE}.may));;
      value_format: "0.00"
    }

    dimension: Jun {
      type: number
      sql: if(IS_NAN(${TABLE}.jun), null, (${TABLE}.jun));;
      value_format: "0.00"
    }

    dimension: Jul {
      type: number
      sql: if(IS_NAN(${TABLE}.jul), null, (${TABLE}.jul));;
      value_format: "0.00"
    }

    dimension: Aug {
      type: number
      sql: if(IS_NAN(${TABLE}.aug), null, (${TABLE}.aug));;
      value_format: "0.00"
    }

    dimension: Sep {
      type: number
      sql: if(IS_NAN(${TABLE}.sep), null, (${TABLE}.sep));;
      value_format: "0.00"
    }

    dimension: Oct {
      type: number
      sql: if(IS_NAN(${TABLE}.oct), null, (${TABLE}.oct));;
      value_format: "0.00"
    }

    dimension: Nov {
      type: number
      sql: if(IS_NAN(${TABLE}.nov), null, (${TABLE}.nov));;
      value_format: "0.00"
    }

    dimension: Dec {
      type: number
      sql: if(IS_NAN(${TABLE}.dec), null, (${TABLE}.dec));;
      value_format: "0.00"
    }
}
