with
    source_customers as (
        select
            cast(CUSTOMER_ID as string) as id_customer
	        , cast(COMPANY_NAME as string) as company_name
	        , cast(CONTACT_NAME as string) as customer_name
	        , cast(CONTACT_TITLE as string) as customer_contact_title
	        , cast(ADDRESS as string) as address
	        , cast(CITY as string) as city
	        , cast(REGION as string) as region
	        , cast(POSTAL_CODE as string) as postal_code
	        , cast(COUNTRY as string) as country
	        , cast(PHONE as string) as phone
	        , cast(FAX as string) as fax
        from {{source('erp_north', 'customers')}}
    )

select * from source_customers
