- dashboard: sales_forecast
  title: Sales Forecast
  layout: newspaper
  embed_style:
    background_color: "#E6E6E6"
    show_title: false
    title_color: "#3a4245"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: "#E6E6E6"
  elements:
  - title: Average Daily Sales Prediction
    name: Average Daily Sales Prediction
    model: wip
    explore: v_sales_forecast
    type: single_value
    fields: [v_sales_forecast.average_predicted_value]
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
    custom_color: "#353b49"
    value_format: "$#,##0.00"
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_sales_forecast.client_id
      Province: v_sales_forecast.province
      City: v_sales_forecast.city
      Store: v_sales_forecast.store
      Revenue_Center: v_sales_forecast.revenue_center
      Item: v_sales_forecast.item
      Date_Range: v_sales_forecast.date
    row: 0
    col: 9
    width: 5
    height: 4
  - title: Prediction Sales Sum
    name: Prediction Sales Sum
    model: wip
    explore: v_sales_forecast
    type: single_value
    fields: [v_sales_forecast.total_predicted_value]
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
    value_format: "$#,##0.00"
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_sales_forecast.client_id
      Province: v_sales_forecast.province
      City: v_sales_forecast.city
      Store: v_sales_forecast.store
      Revenue_Center: v_sales_forecast.revenue_center
      Item: v_sales_forecast.item
      Date_Range: v_sales_forecast.date
    row: 0
    col: 14
    width: 5
    height: 4
  - title: Revenue Change
    name: Revenue Change
    model: wip
    explore: v_sales_forecast
    type: single_value
    fields: [v_sales_forecast.sales_delta]
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
    value_format: "$#,##0.00"
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_sales_forecast.client_id
      Province: v_sales_forecast.province
      City: v_sales_forecast.city
      Store: v_sales_forecast.store
      Revenue_Center: v_sales_forecast.revenue_center
      Item: v_sales_forecast.item
      Date_Range: v_sales_forecast.date
    row: 0
    col: 19
    width: 5
    height: 4
  - title: Top Variables
    name: Top Variables
    model: wip
    explore: v_model_metadata_kpi
    type: looker_grid
    fields: [v_model_metadata_kpi.average_value, v_model_metadata_kpi.key_label]
    filters:
      v_model_metadata_kpi.type: gain
    sorts: [v_model_metadata_kpi.average_value desc]
    limit: 500
    show_view_names: false
    show_row_numbers: false
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
    color_application:
      collection_id: legacy
      palette_id: looker_classic
      options:
        steps: 5
        reverse: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_column_widths:
      v_model_metadata_kpi.key: 211
    series_cell_visualizations:
      v_model_metadata_kpi.average_value:
        is_active: true
        palette:
          palette_id: legacy_sequential2
          collection_id: legacy
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '5'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: !!null '',
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: v_model_metadata_kpi.average_value,
            id: v_model_metadata_kpi.average_value, name: Average Value}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: true
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      v_model_metadata_kpi.average_value: "#e9b404"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    x_axis_label_rotation_bar: -45
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    truncate_column_names: false
    up_color: "#62bad4"
    down_color: "#a9c574"
    total_color: "#929292"
    map_plot_mode: points
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
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    show_null_points: true
    listen:
      Client: v_model_metadata_kpi.client_id
      Province: v_model_metadata_kpi.province
      City: v_model_metadata_kpi.city
      Store: v_model_metadata_kpi.store
      Revenue_Center: v_model_metadata_kpi.revenue_center
      Item: v_model_metadata_kpi.item
    row: 0
    col: 0
    width: 9
    height: 4
  - title: Sales Prediction
    name: Sales Prediction
    model: wip
    explore: v_sales_forecast
    type: looker_line
    fields: [v_sales_forecast.total_predicted_value, v_sales_forecast.total_historical_sales,
      v_sales_forecast.date]
    fill_fields: [v_sales_forecast.date]
    sorts: [v_sales_forecast.date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: v_sales_forecast.total_historical_sales,
            id: v_sales_forecast.total_historical_sales, name: Total Historical Sales},
          {axisId: v_sales_forecast.total_predicted_value, id: v_sales_forecast.total_predicted_value,
            name: Total Predicted Value}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      v_sales_forecast.total_historical_sales: column
    series_colors:
      v_sales_forecast.total_predicted_value: "#ff7f00"
      v_sales_forecast.total_historical_sales: "#A2BF39"
    defaults_version: 1
    listen:
      Client: v_sales_forecast.client_id
      Province: v_sales_forecast.province
      City: v_sales_forecast.city
      Store: v_sales_forecast.store
      Revenue_Center: v_sales_forecast.revenue_center
      Item: v_sales_forecast.item
      Date_Range: v_sales_forecast.date
    row: 4
    col: 0
    width: 24
    height: 7
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: []
    field: v_sales_forecast.client_id
  - name: Province
    title: Province
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: [Client]
    field: v_sales_forecast.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: [Province, Client]
    field: v_sales_forecast.city
  - name: Store
    title: Store
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: [Province, City, Client]
    field: v_sales_forecast.store
  - name: Revenue_Center
    title: Revenue_Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: [Province, City, Client]
    field: v_sales_forecast.revenue_center
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_sales_forecast
    listens_to_filters: [Province, City, Revenue_Center, Client]
    field: v_sales_forecast.item
  - name: Date_Range
    title: Date_Range
    type: field_filter
    default_value: 2020/03/01 to 2020/03/31
    allow_multiple_values: true
    required: false
    model: wip
    explore: wip_time_range
    listens_to_filters: []
    field: wip_time_range.range_start_date
