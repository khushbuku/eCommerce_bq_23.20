view: function {
  derived_table: {
    explore_source: order_items {
      column: total_sale_price {}
      column: order_id {}
      column: id {}
      column: returned_date {}
      derived_column: previous_day_check {
        sql: lag(total_sale_price,1,0) over(order by returned_date)  ;;
      }
      derived_column: previous_2day_check {
        sql: lag(total_sale_price,2,0) over(order by returned_date)  ;;
      }
      derived_column: previous_3day_check {
        sql: lag(total_sale_price,3,0) over(order by returned_date)  ;;
      }
    }
  }
  dimension: total_sale_price {
    description: ""
    type: number
  }
  measure: net_cost {
    type: sum
    label: "Anomaly Cost"
    sql: ${total_sale_price} ;;
    value_format: "€#,##0.00"
  }
  dimension: previous_day_check {
    type: number
  }
  measure: previous_day_check_cost {
    label: "Anomaly -1day check"
    type: sum
    sql: ${previous_day_check} ;;
    value_format: "€#,##0.00"
  }
  dimension: previous_2day_check {
    type: number
  }
  measure: previous_2day_check_cost {
    label: "Anomaly -2day check"
    type: sum
    sql: ${previous_2day_check} ;;
    value_format: "€#,##0.00"
  }
  dimension: previous_3day_check {
    type: number
  }
  measure: previous_3day_check_cost {
    label: "Anomaly -3day check"
    type: sum
    sql: ${previous_3day_check} ;;
    value_format: "€#,##0.00"
  }
  dimension: order_id {
    description: ""
    type: number
  }
  dimension: id {
    description: ""
    primary_key: yes
    type: number
  }
  dimension: returned_date {
    label: "Anomaly Date"
    type: date
  }
}
