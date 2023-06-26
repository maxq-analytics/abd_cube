cubes:
  - name: iowa_liquor_sales
    sql_table: dbt_dev_diageo.iowa_liquor_sales

    measures:
      - name: invoice_count
        sql: invoice_and_item_number
        type: count
      - name: bottles_sold
        sql: bottles_sold
        type: sum
      - name: volume_sold_liters
        sql: volume_sold_liters
        type: sum
      - name: sale_dollars
        sql: sale_dollars
        type: sum
        # Invoice Count
      - name: average_sale_dollars_per_invoice
        sql: "ROUND({sale_dollars} / {invoice_count},2)"
        type: number
      - name: average_bottles_sold_per_invoice
        sql: "ROUND({bottles_sold} / {invoice_count},2)"
        type: number
        # Bottles Sold
      - name: average_sale_dollars_per_bottle
        sql: "ROUND({sale_dollars} / {bottles_sold},2)"
        type: number
      - name: average_liter_per_bottle
        sql: "ROUND({volume_sold_liters} / {bottles_sold},2)"
        type: number
        # Liters Sold
      - name: average_sale_dollars_per_liter
        sql: "ROUND({sale_dollars} / {volume_sold_liters},2)"
        type: number

    dimensions:
      - name: invoice_and_item_number
        sql: invoice_and_item_number
        type: string
        primary_key: true
      - name: invoice_date
        sql: invoice_date
        type: time
      - name: store_number
        sql: store_number
        type: string
      - name: item_number
        sql: item_number
        type: string
      - name: item_description
        sql: item_description
        type: string
      - name: store_address
        sql: store_address
        type: string
      - name: items_in_pack
        sql: items_in_pack
        type: string
      - name: brand_name
        sql: brand_name
        type: string
      - name: bottle_volume_ml
        sql: bottle_volume_ml
        type: string
      - name: state_bottle_retail
        sql: state_bottle_retail
        type: string
      - name: category_name
        sql: category_name
        type: string
      - name: store_name
        sql: store_name
        type: string
      - name: store_address
        sql: store_address
        type: string
      - name: store_city
        sql: store_city
        type: string
