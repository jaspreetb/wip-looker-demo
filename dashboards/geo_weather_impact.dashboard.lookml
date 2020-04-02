- dashboard: geo_weather_impact
  title: WIP 4 - Geo Weather Impact
  layout: newspaper
  elements:
  - title: Percentage of Stores with > 10% Reduced Prediction Error
    name: Percentage of Stores with > 10% Reduced Prediction Error
    model: wip
    explore: v_geo_weather_impact
    type: looker_column
    fields: [v_geo_weather_impact.store_percentage_ge_10, v_geo_weather_impact.province]
    filters:
      v_geo_weather_impact.meta_data_key: '"rmse_historical_reduction"'
    sorts: [v_geo_weather_impact.store_percentage_ge_10 desc]
    limit: 500
    dynamic_fields: [{dimension: province_key, label: Province Key, expression: 'concat(${v_geo_weather_impact.province},"_",
          coalesce(${v_geo_weather_impact.revenue_center},""),"_", coalesce(${v_geo_weather_impact.item},""))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
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
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_label: ''
    series_types: {}
    series_colors:
      v_geo_weather_impact.store_percentage_ge_10: "#C2DD67"
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    up_color: "#3EB0D5"
    down_color: "#B1399E"
    total_color: "#C2DD67"
    listen:
      Client: v_geo_weather_impact.client_id
      Province: v_geo_weather_impact.province
      City: v_geo_weather_impact.city
      Month: v_geo_weather_impact.month
      Revenue_Center: v_geo_weather_impact.revenue_center
      Item: v_geo_weather_impact.item
    row: 3
    col: 10
    width: 14
    height: 7
  - title: Average Impact
    name: Average Impact
    model: wip
    explore: v_geo_weather_impact
    type: single_value
    fields: [v_geo_weather_impact.average_meta_data_value]
    filters:
      v_geo_weather_impact.meta_data_key: '"rmse_historical_reduction"'
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
    value_format: 0.00%
    series_types: {}
    defaults_version: 1
    listen:
      Client: v_geo_weather_impact.client_id
      Province: v_geo_weather_impact.province
      City: v_geo_weather_impact.city
      Month: v_geo_weather_impact.month
      Revenue_Center: v_geo_weather_impact.revenue_center
      Item: v_geo_weather_impact.item
    row: 0
    col: 10
    width: 7
    height: 3
  - title: Store Average RMSE
    name: Store Average RMSE
    model: wip
    explore: v_geo_weather_impact
    type: looker_map
    fields: [v_geo_weather_impact.location, v_geo_weather_impact.store, v_geo_weather_impact.average_meta_data_value]
    filters:
      v_geo_weather_impact.location_bin_level: '9'
      v_geo_weather_impact.location: inside box from 55.7765730186677, -135.00000000000003
        to 40.979898069620155, -22.5
      v_geo_weather_impact.meta_data_key: '"rmse_historical_reduction"'
      v_geo_weather_impact.meta_data_value: ">=0.1"
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
    map_latitude: 48.748945343432936
    map_longitude: -87.89062500000001
    map_zoom: 3
    series_types: {}
    defaults_version: 1
    hidden_fields:
    title_hidden: true
    listen:
      Client: v_geo_weather_impact.client_id
      Province: v_geo_weather_impact.province
      City: v_geo_weather_impact.city
      Month: v_geo_weather_impact.month
      Revenue_Center: v_geo_weather_impact.revenue_center
      Item: v_geo_weather_impact.item
    row: 0
    col: 0
    width: 10
    height: 10
  - title: Top Variables
    name: Top Variables
    model: wip
    explore: v_geo_weather_impact
    type: looker_grid
    fields: [v_geo_weather_impact.meta_data_key, v_geo_weather_impact.average_meta_data_value]
    sorts: [v_geo_weather_impact.average_meta_data_value desc]
    limit: 500
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      v_geo_weather_impact.meta_data_key: Top Variables
      v_geo_weather_impact.average_meta_data_value: Value
    series_cell_visualizations:
      v_geo_weather_impact.average_meta_data_value:
        is_active: true
        palette:
          palette_id: 6b862f6a-df4e-3382-feb5-918c6129d0b0
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#ffffff"
          - "#ffdf05"
          - "#f59105"
    series_text_format:
      v_geo_weather_impact.meta_data_key:
        align: left
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_value_format:
      v_geo_weather_impact.average_meta_data_value:
        name: decimal_2
        format_string: "#,##0.00"
        label: Decimals (2)
    series_types: {}
    defaults_version: 1
    hidden_fields: [v_geo_weather_impact.average_meta_data_value]
    title_hidden: true
    listen:
      Client: v_geo_weather_impact.client_id
      Province: v_geo_weather_impact.province
      City: v_geo_weather_impact.city
      Month: v_geo_weather_impact.month
      Revenue_Center: v_geo_weather_impact.revenue_center
      Item: v_geo_weather_impact.item
    row: 0
    col: 17
    width: 7
    height: 3
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: '9001'
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: []
    field: v_geo_weather_impact.client_id
  - name: Province
    title: Province
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: [Client]
    field: v_geo_weather_impact.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: [Client, Province]
    field: v_geo_weather_impact.city
  - name: Month
    title: Month
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: []
    field: v_geo_weather_impact.month
  - name: Revenue_Center
    title: Revenue_Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: [Client, Province, City]
    field: v_geo_weather_impact.revenue_center
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip
    explore: v_geo_weather_impact
    listens_to_filters: [Client, Province, City]
    field: v_geo_weather_impact.item
