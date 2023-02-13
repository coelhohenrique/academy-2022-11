with    
    source_employees as (
        select
            cast(EMPLOYEE_ID as int) as id_employee
	        , cast(REPORTS_TO as int) as id_manager
            , cast((FIRST_NAME ||' '|| LAST_NAME) as string) as complete_surname
	        , cast(TITLE as string) as title
	        , cast(TITLE_OF_COURTESY as string) as title_of_courtesy
	        , cast(BIRTH_DATE as date) as birth_date
	        , cast(HIRE_DATE as date) as hire_date
	        , cast(ADDRESS as string) as address
	        , cast(CITY as string) as city
	        , cast(REGION as string) as region
	        , cast(COUNTRY as string) as country
	        , cast(POSTAL_CODE as string) as postal_code
	        , cast(HOME_PHONE as string) as home_phone
	        --, cast(EXTENSION as string) as
	        --, cast(PHOTO as ) as
	        --, cast(NOTES as ) as
	        --, cast(PHOTO_PAT as ) as
        from {{source('erp_north','employees')}}
    )

    select * from source_employees 