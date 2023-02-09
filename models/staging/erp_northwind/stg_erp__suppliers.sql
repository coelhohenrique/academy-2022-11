with
    source_suppliers as (
        select
            cast(SUPPLIER_ID as int) as id_supplier
	        , cast(COMPANY_NAME as string) as supplier_name
	        , cast(CONTACT_NAME as string) as supplier_contact_name
	        , cast(CONTACT_TITLE as string) as contact_title
	        , cast(POSTAL_CODE as string) as postal_code
	        , cast(ADDRESS as string) as address
	        , cast(CITY as string) as city
	        , cast(REGION as string) as region
	        , cast(COUNTRY as string) as country
	        , cast(PHONE as string) as phone
	        , cast(FAX as string) as fax
	        --, HOMEPAGE 
        from {{source('erp_north', 'suppliers')}}
    )

    select * from source_suppliers