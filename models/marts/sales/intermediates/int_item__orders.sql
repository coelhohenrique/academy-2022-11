with
    orders as (
        select
            id_order
	        , id_customer
	        , id_employee
	        , id_shipper
	        , order_date
	        , required_date
	        , shipped_date
	        , freight
	        , ship_name
	        , ship_address
	        , ship_city
	        , ship_region
	        , ship_postal_code
	        , ship_country 
        from {{ref('stg_erp__orders')}}
    )

    , item_orders as (
        select 
            id_order
	        , id_product
	        , quantity
	        , unit_price
	        , discount
        from {{ref('stg_erp__order_details')}}
    )

    , fan_out as (
        select
            orders.id_order
	        , orders.id_customer
	        , orders.id_employee
            , item_orders.id_product
	        , orders.id_shipper
	        , item_orders.quantity
	        , item_orders.unit_price
	        , item_orders.discount
	        , orders.order_date
	        , orders.required_date
	        , orders.shipped_date
	        , orders.freight
	        , orders.ship_name
	        , orders.ship_address
	        , orders.ship_city
	        , orders.ship_region
	        , orders.ship_postal_code
	        , orders.ship_country 
        from orders
        left join item_orders on orders.id_order = item_orders.id_order
    )

    select * from fan_out