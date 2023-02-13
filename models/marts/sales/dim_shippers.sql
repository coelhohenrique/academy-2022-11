with
    shippers as (
        select *
        from {{ref('stg_erp__shippers')}}
    )

    , transformed as (
        select 
            row_number() over (order by id_shipper) as sk_shipper
            , id_shipper
	        , shipper_name
	        , phone
        from shippers
    )

    select * from transformed