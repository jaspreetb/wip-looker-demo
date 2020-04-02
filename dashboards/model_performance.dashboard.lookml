- dashboard: model_performance
  title: WIP 3 - Model Performance
  layout: newspaper
  elements:
  - title: Model Performance Overtime
    name: Model Performance Overtime
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: v_evaluation_set.total_actual_sales,
            id: v_evaluation_set.total_actual_sales, name: Total Actual Sales}, {
            axisId: v_evaluation_set.total_predicted_value, id: v_evaluation_set.total_predicted_value,
            name: Total Predicted Value}, {axisId: v_evaluation_set.total_historical_sales,
            id: v_evaluation_set.total_historical_sales, name: Total Historical Sales}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: "$0.00"
    series_types:
      v_evaluation_set.total_historical_sales: area
    series_colors:
      v_evaluation_set.total_actual_sales: "#E57947"
      v_evaluation_set.total_historical_sales: "#dce6e3"
      v_evaluation_set.total_predicted_value: "#72D16D"
    series_labels:
      v_evaluation_set.total_historical_sales: Last Year Sales
    defaults_version: 1
    title_hidden: true
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Date_Range: v_evaluation_set.date
    row: 3
    col: 8
    width: 16
    height: 7
  - title: Root Mean Square Error (Actual vs Prediction)
    name: Root Mean Square Error (Actual vs Prediction)
    model: wip
    explore: v_evaluation_set
    type: single_value
    fields: [v_evaluation_set.rmse_predict_actual]
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
    value_format: "$0.00"
    defaults_version: 1
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Date_Range: v_evaluation_set.date
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Root Mean Square Error (Actual vs Last Year Sales)
    name: Root Mean Square Error (Actual vs Last Year Sales)
    model: wip
    explore: v_evaluation_set
    type: single_value
    fields: [v_evaluation_set.rmse_historical_actual]
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
    value_format: "$0.00"
    defaults_version: 1
    listen:
      Client: v_evaluation_set.client_id
      Province: v_evaluation_set.province
      City: v_evaluation_set.city
      Store: v_evaluation_set.store
      Revenue_Center: v_evaluation_set.revenue_center
      Item: v_evaluation_set.item
      Date_Range: v_evaluation_set.date
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Prediction Overview
    name: Prediction Overview
    model: wip
    explore: v_model_performance
    type: looker_map
    fields: [v_model_performance.location, v_model_performance.total_predicted_value,
      v_model_performance.store]
    filters:
      v_model_performance.location_bin_level: '8'
      v_model_performance.location: inside box from 66.51326044311188, -180 to 0,
        0
    sorts: [v_model_performance.total_predicted_value desc]
    limit: 5000
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 48.40003249610685
    map_longitude: -88.06640625000001
    map_zoom: 3
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_model_performance.client_id
      Province: v_model_performance.province
      City: v_model_performance.city
      Store: v_model_performance.store
      Revenue_Center: v_model_performance.revenue_center
      Item: v_model_performance.item
      Date_Range: v_model_performance.date
    row: 0
    col: 0
    width: 8
    height: 10
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: ''
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
    listens_to_filters: [Client]
    field: v_evaluation_set.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: [Client, Province]
    field: v_evaluation_set.city
  - name: Store
    title: Store
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: [Client, Province, City]
    field: v_evaluation_set.store
  - name: Revenue_Center
    title: Revenue_Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: [Client, Province, City, Store]
    field: v_evaluation_set.revenue_center
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_evaluation_set
    listens_to_filters: [Client, Province, City, Store]
    field: v_evaluation_set.item
  - name: Date_Range
    title: Date_Range
    type: date_filter
    default_value: 2019/05/01 to 2019/06/01
    allow_multiple_values: true
    required: false
