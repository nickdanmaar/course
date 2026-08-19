{{
  config(
    materialized = 'table'
    )
}}

WITH src_hosts AS (
    SELECT
        *
    FROM
        {{ ref('src_hosts') }}
)
SELECT
    host_id,
    NVL(
        host_name,
        'N/A'
    ) AS host_name,
/*    IFF(is_superhost = 't', TRUE, FALSE) as is_superhost,*/
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts