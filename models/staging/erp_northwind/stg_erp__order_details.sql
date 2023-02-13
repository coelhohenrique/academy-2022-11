with
    source_order_details as (
        select
            cast(ORDER_ID as int) as id_order
	        , cast(PRODUCT_ID as int) as id_product
	        , cast(QUANTITY as int) as quantity
	        , cast(UNIT_PRICE as numeric) as unit_price
	        , cast(DISCOUNT as numeric) as discount
        from {{source('erp_north', 'order_details')}}
    )

    select * from source_order_details