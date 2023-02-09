with
    source_shippers as (
        select
        cast(SHIPPER_ID as int) as id_shipper
	    , cast(COMPANY_NAME as string) as shipper_name
	    , cast(PHONE as string) as phone
        from {{source('erp_north', 'shippers')}}
    )

    select * from source_shippers