with
    customers as (
        select * from {{ref('dim_customers')}}
    )

    , employees as (
        select * from {{ref('dim_employees')}}
    )

    , products as (
        select * from {{ref('dim_products')}}
    )

    , shippers as (
        select * from {{ref('dim_shippers')}}
    )

    , item_orders as (
        select * from {{ref('int_item__orders')}}
    )

    , joined as (
        select
            item_orders.id_order
	        , customers.sk_customer as fk_customer
	        , employees.sk_employee as fk_employee
            , products.sk_product as fk_product
	        , shippers.sk_shipper as fk_shipper
	        , item_orders.quantity
	        , item_orders.unit_price
	        , item_orders.discount
	        , item_orders.order_date
	        , item_orders.required_date
	        , item_orders.shipped_date
	        , item_orders.freight
	        , item_orders.ship_name
	        , item_orders.ship_address
	        , item_orders.ship_city
	        , item_orders.ship_region
	        , item_orders.ship_postal_code
	        , item_orders.ship_country 
            , customers.customer_name
            , employees.complete_surname
            , employees.manager
            , shippers.shipper_name
            , products.product_name
            , products.category_name
            , products.supplier_contact_name
            , products.is_discontinued
        from item_orders
        left join customers on item_orders.id_customer = customers.id_customer
        left join employees on item_orders.id_employee = employees.id_employee
        left join products on item_orders.id_product = products.id_product
        left join shippers on item_orders.id_shipper = shippers.id_shipper
    )

    , transformations as (
        select 
        *
        , id_order || '-' || fk_product as sk_sales
        , unit_price * quantity as gross_income
        ,  (1 - discount) * unit_price * quantity as net_revenue

        from joined
    )



    select * from transformations