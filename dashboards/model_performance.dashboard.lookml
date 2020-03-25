- dashboard: model_performance
  title: Forecast Model Performance
  layout: newspaper
  embed_style:
    background_color: "#FAFAFA"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: ''
  elements:
  - title: Model Performance
    name: Model Performance
    model: wip
    explore: v_evaluation_set
    type: looker_line
    fields: [v_evaluation_set.total_actual_sales, v_evaluation_set.total_historical_sales,
      v_evaluation_set.total_predicted_value, v_evaluation_set.date]
    fill_fields: [v_evaluation_set.date]
    sorts: [v_evaluation_set.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: v_evaluation_set.total_actual_sales,
            id: v_evaluation_set.total_actual_sales, name: Total Actual Sales}, {
            axisId: v_evaluation_set.total_historical_sales, id: v_evaluation_set.total_historical_sales,
            name: Total Historical Sales}, {axisId: v_evaluation_set.total_predicted_value,
            id: v_evaluation_set.total_predicted_value, name: Total Predicted Value}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types:
      v_evaluation_set.total_historical_sales: area
    series_colors:
      v_evaluation_set.total_actual_sales: "#A2BF39"
      v_evaluation_set.total_historical_sales: "#b9b9b9"
      v_evaluation_set.total_predicted_value: "#db7f2a"
    defaults_version: 1
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Time_Range: v_evaluation_set.date
    row: 0
    col: 5
    width: 19
    height: 8
  - title: Root Mean Square Error
    name: Root Mean Square Error
    model: wip
    explore: v_evaluation_set
    type: single_value
    fields: [v_evaluation_set.rmse]
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
    custom_color: "#ff7f00"
    single_value_title: RMSE
    value_format: "#,##0.00"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Time_Range: v_evaluation_set.date
    row: 0
    col: 0
    width: 5
    height: 4
  - title: Mean Average Error
    name: Mean Average Error
    model: wip
    explore: v_evaluation_set
    type: single_value
    fields: [v_evaluation_set.mae]
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
    custom_color: "#ff7f00"
    single_value_title: MAE
    value_format: "#,##0.00"
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Time_Range: v_evaluation_set.date
    row: 4
    col: 0
    width: 5
    height: 4
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: '9001'
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.client_id
  - name: Province
    title: Province
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.city
  - name: Store
    title: Store
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.store
  - name: Revenue_Center
    title: Revenue_Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.revenue_center
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: []
    field: v_evaluation_set.item
  - name: Time_Range
    title: Time_Range
    type: date_filter
    default_value: 2018/11/01 to 2018/11/30
    allow_multiple_values: true
    required: false
