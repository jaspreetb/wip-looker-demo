- dashboard: wip_poc
  title: WIP PoC
  layout: newspaper
  elements:
  - title: Weather Sales Correlation
    name: Weather Sales Correlation
    model: lana_test_wip
    explore: wip_weather_sales
    type: looker_column
    fields: [wip_weather_sales.avg_weather_value, wip_weather_sales.total_sales, wip_weather_sales.date,
      wip_weather_sales.weather_condition]
    filters: {}
    sorts: [wip_weather_sales.date desc]
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
    stacking: normal
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
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    y_axes: [{label: Total Sales, orientation: left, series: [{axisId: wip_weather_sales.total_sales,
            id: wip_weather_sales.total_sales, name: Total Sales}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: wip_weather_sales.avg_weather_value, id: wip_weather_sales.avg_weather_value,
            name: Average Weather Value}], showLabels: true, showValues: true, valueFormat: '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      wip_weather_sales.avg_weather_value: line
    series_labels:
      wip_weather_sales.avg_weather_value: Average Weather Value
      wip_weather_sales.total_sales: Total Sales
    x_axis_datetime_label: "%b %y, %Y"
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Client: wip_weather_sales.client_id
      Historical Date Range: wip_weather_sales.date
      Weather Condition: wip_weather_sales.weather_condition
      Province: wip_weather_sales.province
      City: wip_weather_sales.city
      Store Address: wip_weather_sales.store
      Revenue Center: wip_weather_sales.revenue_center
      Item: wip_weather_sales.item
    row: 9
    col: 0
    width: 12
    height: 8
  - title: Forecast Model Performance
    name: Forecast Model Performance
    model: lana_test_wip
    explore: wip_sales_prediction
    type: looker_line
    fields: [wip_sales_prediction.total_actual_value, wip_sales_prediction.total_predicted_value,
      wip_sales_prediction.date]
    fill_fields: [wip_sales_prediction.date]
    sorts: [wip_sales_prediction.date desc]
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
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: legacy
      palette_id: santa_cruz
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: wip_sales_prediction.total_predicted_value,
            id: wip_sales_prediction.total_predicted_value, name: Total Predicted
              Value}, {axisId: wip_sales_prediction.total_actual_value, id: wip_sales_prediction.total_actual_value,
            name: Total Actual Value}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_colors: {}
    x_axis_datetime_label: "%b %y, %Y"
    defaults_version: 1
    listen:
      Client: wip_sales_prediction.client_id
      Historical Date Range: wip_sales_prediction.date
      Province: wip_sales_prediction.province
      City: wip_sales_prediction.city
      Store Address: wip_sales_prediction.store
      Revenue Center: wip_sales_prediction.revenue_center
      Item: wip_sales_prediction.item
    row: 9
    col: 12
    width: 12
    height: 8
  - title: Sales Prediction
    name: Sales Prediction
    model: lana_test_wip
    explore: wip_sales_forecast
    type: looker_line
    fields: [wip_sales_forecast.total_predicted_value, wip_sales_forecast.date]
    fill_fields: [wip_sales_forecast.date]
    sorts: [wip_sales_forecast.date desc]
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
    show_null_points: true
    interpolation: linear
    series_types: {}
    x_axis_datetime_label: "%b %y, %Y"
    defaults_version: 1
    listen:
      Client: wip_sales_forecast.client_id
      Forecast Date Range: wip_sales_forecast.date
      Province: wip_sales_forecast.province
      City: wip_sales_forecast.city
      Store Address: wip_sales_forecast.store
      Revenue Center: wip_sales_forecast.revenue_center
      Item: wip_sales_forecast.item
    row: 0
    col: 8
    width: 16
    height: 9
  - title: Top 10 Meta Data
    name: Top 10 Meta Data
    model: lana_test_wip
    explore: wip_model_metadata_kpi
    type: looker_grid
    fields: [wip_model_metadata_kpi.total_value, wip_model_metadata_kpi.key]
    filters:
      wip_model_metadata_kpi.type: gain
    sorts: [wip_model_metadata_kpi.total_value desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      wip_model_metadata_kpi.key: 241
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    defaults_version: 1
    listen:
      Client: wip_model_metadata_kpi.client_id
      Province: wip_model_metadata_kpi.province
      City: wip_model_metadata_kpi.city
      Store Address: wip_model_metadata_kpi.store
      Revenue Center: wip_model_metadata_kpi.revenue_center
      Item: wip_model_metadata_kpi.item
    row: 3
    col: 0
    width: 8
    height: 6
  - title: Mean Average Error
    name: Mean Average Error
    model: lana_test_wip
    explore: wip_model_metadata_kpi
    type: single_value
    fields: [wip_model_metadata_kpi.total_value]
    filters:
      wip_model_metadata_kpi.type: error
      wip_model_metadata_kpi.key: MAE
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    series_types: {}
    defaults_version: 1
    listen:
      Client: wip_model_metadata_kpi.client_id
      Historical Date Range: wip_model_metadata_kpi.date
      Province: wip_model_metadata_kpi.province
      City: wip_model_metadata_kpi.city
      Store Address: wip_model_metadata_kpi.store
      Revenue Center: wip_model_metadata_kpi.revenue_center
      Item: wip_model_metadata_kpi.item
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Mean Sales
    name: Mean Sales
    model: lana_test_wip
    explore: wip_model_metadata_kpi
    type: single_value
    fields: [wip_model_metadata_kpi.total_value]
    filters:
      wip_model_metadata_kpi.type: error
      wip_model_metadata_kpi.key: '"mean_sales"'
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Client: wip_model_metadata_kpi.client_id
      Province: wip_model_metadata_kpi.province
      City: wip_model_metadata_kpi.city
      Store Address: wip_model_metadata_kpi.store
      Revenue Center: wip_model_metadata_kpi.revenue_center
      Item: wip_model_metadata_kpi.item
    row: 0
    col: 4
    width: 4
    height: 3
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: '9001'
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: []
    field: wip_product.client_id
  - name: Historical Date Range
    title: Historical Date Range
    type: date_filter
    default_value: 2019/02/08 to 2019/03/28
    allow_multiple_values: true
    required: false
  - name: Forecast Date Range
    title: Forecast Date Range
    type: date_filter
    default_value: 2020/02/24 to 2020/03/08
    allow_multiple_values: true
    required: false
  - name: Weather Condition
    title: Weather Condition
    type: field_filter
    default_value: temp
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_weather_sales
    listens_to_filters: []
    field: wip_weather_sales.weather_condition
  - name: Province
    title: Province
    type: field_filter
    default_value: 'ON'
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: [Client]
    field: wip_product.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: [Client, Province]
    field: wip_product.city
  - name: Store Address
    title: Store Address
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: [Client, Province, City]
    field: wip_product.store
  - name: Revenue Center
    title: Revenue Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: [Province, City, Store Address]
    field: wip_product.dim1
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: lana_test_wip
    explore: wip_product
    listens_to_filters: [Province, City, Store Address]
    field: wip_product.dim2
