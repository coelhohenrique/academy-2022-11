    with
    categories as (
        select 
            id_category
            , category_name
            , description
        from {{ref('stg_erp__categories')}}
    )

    , products as (
        select *
        from {{ref('stg_erp__products')}}
    )

    , suppliers as (
        select *
        from {{ref('stg_erp__suppliers')}}
    )

    , joined_tables as (
        select 
            products.id_product
            , products.id_supplier
            , products.id_category
            , products.product_name
            , products.quantity_per_unit
            , products.unit_price
            , products.units_in_stock
            , products.units_on_order
            , products.reorder_level
            , products.is_discontinued
            , categories.category_name
            , categories.description
            , suppliers.supplier_name
            , suppliers.supplier_contact_name
            , suppliers.contact_title
            , suppliers.address
            , suppliers.postal_code
            , suppliers.city
            , suppliers.region
            , suppliers.country
            , suppliers.fax
            , suppliers.phone
        from products
        left join categories on products.id_category = categories.id_category
        left join suppliers on products.id_supplier = suppliers.id_supplier
    )

    , transformation as (
        select
            row_number() over (order by id_product) as sk_product
            , *
        from joined_tables
    )

select * from transformation
