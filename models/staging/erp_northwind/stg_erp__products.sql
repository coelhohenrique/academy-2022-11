with
    source_products as (
        select
            cast(PRODUCT_ID as int) as id_product
            , cast(SUPPLIER_ID as int) as id_supplier
            , cast(CATEGORY_ID as int) as id_category
            , cast(PRODUCT_NAME as string) as product_name
            , cast(QUANTITY_PER_UNIT as string) as quantity_per_unit
            , cast(UNIT_PRICE as numeric) as unit_price
            , cast(UNITS_IN_STOCK as int) as  units_in_stock
            , cast(UNITS_ON_ORDER as int) as units_on_order
            , cast(REORDER_LEVEL as int) as reorder_level
            , case
                when DISCONTINUED = 1 then true
                else false
            end as is_discontinued
        from {{source('erp_north', 'products')}}
    )

    select * from source_products