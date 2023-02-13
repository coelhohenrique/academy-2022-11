with
    customers as(
        select *
        from {{ref('stg_erp__customers')}}
    )

, transformed as (
    select
        row_number() over (order by id_customer) as sk_customer
        , id_customer
	    , company_name
	    , customer_name
	    , customer_contact_title
	    , address
	    , city
	    , region
	    , postal_code
	    , country
	    , phone
	    , fax
    from customers
)

select * from transformed