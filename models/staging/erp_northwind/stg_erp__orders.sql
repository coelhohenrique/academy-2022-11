with    
    source_orders as(
        select
            cast(ORDER_ID as int) as id_order
	        , cast(CUSTOMER_ID as int) as id_customer
	        , cast(EMPLOYEE_ID as int) as id_employee
	        , cast(ORDER_DATE as date) as order_date
	        , cast(REQUIRED_DATE as date) as required_date
	        , cast(SHIPPED_DATE as date) as shipped_date
	        , cast(SHIP_VIA as string) as ship_via
	        , cast(FREIGHT as numeric) as freight
	        , cast(SHIP_NAME as string) as ship_name
	        , cast(SHIP_ADDRESS as string) as ship_address
	        , cast(SHIP_CITY as string) as ship_city
	        , cast(SHIP_REGION as string) as ship_region
	        , cast(SHIP_POSTAL_CODE as string) as ship_postal_code
	        , cast(SHIP_COUNTRY as string) as ship_country
        from {{source('erp_north', 'orders')}}
    )

    select * from source_orders