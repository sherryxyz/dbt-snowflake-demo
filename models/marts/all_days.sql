{{ dbt_utils.date_spine(
    datepart="minute",
    start_date="to_Date('01/01/2018', 'mm/dd/yyyy')",
    end_date="to_Date('01/01/2020', 'mm/dd/yyyy')"
)
}}