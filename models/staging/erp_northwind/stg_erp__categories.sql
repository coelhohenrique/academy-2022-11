with
    source_categories as (
        select
            cast(CATEGORY_ID as int) as id_category
	        , cast(CATEGORY_NAME as string) as category_name
	        , cast(DESCRIPTION as string) as description
	        --, PICTURE
        from {{source('erp_north', 'categories')}}
    )

    select * from source_categories
