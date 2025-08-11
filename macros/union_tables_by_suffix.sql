{% macro union_relationships_by_suffix(database, schemas, suffix) %}
    {% set all_tables = [] %}

    {% for schema in schemas %}
        {% set relations = dbt_utils.get_relations_by_prefix(
            database=database,
            schema=schema,
            prefix=""
        ) %}
        {% for table in relations %}
            {% if table.identifier.endswith(suffix) %}
                {% do all_tables.append(table) %}
            {% endif %}
        {% endfor %}
    {% endfor %}

    {% for table in all_tables %}
        {% if not loop.first %}
            union all
        {% endif %}

        select * from {{ table }}
    {% endfor %}
{% endmacro %}
