with
    employees as (
        select *
        from {{ref('stg_erp__employees')}}
    )

    , self_joined as (
        select
            employees.id_employee
	        , employees.id_manager
            , employees.complete_surname
	        , employees.title
	        , employees.title_of_courtesy
	        , employees.birth_date
	        , employees.hire_date
            , managers.complete_surname as manager
	        , employees.address
	        , employees.city
	        , employees.region
	        , employees.country
	        , employees.postal_code
	        , employees.home_phone
        from employees
        left join employees as managers on
        employees.id_employee = managers.id_employee
    )

    , transformed as (
         select
            row_number() over (order by id_employee) as sk_employee
            , *
         from self_joined
    )

    select * from transformed

    --aula em 1h43