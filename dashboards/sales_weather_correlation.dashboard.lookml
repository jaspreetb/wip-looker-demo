- dashboard: sales_weather_correlation
  title: Sales Weather Correlation
  layout: newspaper
  elements:
  - title: Sales Weather Corrolation
    name: Sales Weather Corrolation
    model: wip_demo
    explore: v_weather_sales
    type: looker_line
    fields: [v_weather_sales.date, v_weather_sales.avg_weather_value, v_weather_sales.daily_sales]
    fill_fields: [v_weather_sales.date]
    sorts: [v_weather_sales.date desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: v_weather_sales.daily_sales,
            id: v_weather_sales.daily_sales, name: Daily Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: v_weather_sales.avg_weather_value,
            id: v_weather_sales.avg_weather_value, name: Avg Weather Value}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      v_weather_sales.daily_sales: column
    series_colors:
      v_weather_sales.daily_sales: "#C2DD67"
      v_weather_sales.avg_weather_value: "#E57947"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Client: v_weather_sales.client_id
      Province: v_weather_sales.province
      City: v_weather_sales.city
      Revenue_Center: v_weather_sales.revenue_center
      Item: v_weather_sales.item
      Date_Range: v_weather_sales.date
      Weather Condition: v_weather_sales.weather_condition
    row: 0
    col: 0
    width: 19
    height: 8
  filters:
  - name: Client
    title: Client
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.client_id
  - name: Province
    title: Province
    type: field_filter
    default_value: 'ON'
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.province
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.city
  - name: Revenue_Center
    title: Revenue_Center
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.revenue_center
  - name: Item
    title: Item
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.item
  - name: Date_Range
    title: Date_Range
    type: date_filter
    default_value: 2017/01/01 to 2017/01/31
    allow_multiple_values: true
    required: false
  - name: Weather Condition
    title: Weather Condition
    type: field_filter
    default_value: temp
    allow_multiple_values: true
    required: false
    model: wip_demo
    explore: v_weather_sales
    listens_to_filters: []
    field: v_weather_sales.weather_condition
