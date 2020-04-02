- dashboard: execution
  title: WIP 1- Execution
  layout: newspaper
  elements:
  - title: Items - Average RMSE Deduction
    name: Items - Average RMSE Deduction
    model: wip
    explore: v_impact
    type: looker_column
    fields: [v_impact.average_impact, v_impact.item_name]
    filters:
      v_impact.impact: ">=0.05"
      v_impact.item: "-NULL"
    sorts: [v_impact.average_impact desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      v_impact.average_impact: "#a9c574"
    defaults_version: 1
    listen: {}
    row: 0
    col: 9
    width: 8
    height: 6
  - title: Revenue Centers - Average RMSE Deduction
    name: Revenue Centers - Average RMSE Deduction
    model: wip
    explore: v_impact
    type: looker_bar
    fields: [v_impact.average_impact, v_impact.revenue_center]
    filters:
      v_impact.impact: ">=0.05"
      v_impact.revenue_center: "-NULL"
    sorts: [v_impact.average_impact desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      v_impact.average_impact: "#a9c574"
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 9
    height: 6
  - title: Weather Correlation
    name: Weather Correlation
    model: wip
    explore: v_weather_month_correlation
    type: looker_grid
    fields: [v_weather_month_correlation.condition_label, v_weather_month_correlation.Jan,
      v_weather_month_correlation.Feb, v_weather_month_correlation.Mar, v_weather_month_correlation.Apr,
      v_weather_month_correlation.May, v_weather_month_correlation.Jun, v_weather_month_correlation.Jul,
      v_weather_month_correlation.Aug, v_weather_month_correlation.Sep, v_weather_month_correlation.Oct,
      v_weather_month_correlation.Nov, v_weather_month_correlation.Dec]
    sorts: [v_weather_month_correlation.condition_label]
    limit: 500
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      v_weather_month_correlation.condition_label: 106
      v_weather_month_correlation.Jan: 70
      v_weather_month_correlation.Feb: 68
      v_weather_month_correlation.Mar: 74
      v_weather_month_correlation.Apr: 67
      v_weather_month_correlation.May: 69
      v_weather_month_correlation.Jun: 72
      v_weather_month_correlation.Jul: 77
      v_weather_month_correlation.Aug: 79
      v_weather_month_correlation.Sep: 81
      v_weather_month_correlation.Oct: 82
      v_weather_month_correlation.Nov: 76
      v_weather_month_correlation.Dec: 83
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging2,
          options: {steps: 10, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: true, stepped: true}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 6
    col: 0
    width: 17
    height: 7
