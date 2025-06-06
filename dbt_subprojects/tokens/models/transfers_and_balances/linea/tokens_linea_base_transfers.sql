{{config(
    schema = 'tokens_linea',
    alias = 'base_transfers',
    partition_by = ['block_month'],
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')],
    unique_key = ['block_date','unique_key'],
)
}}

{{transfers_base(
    blockchain='linea',
    traces = source('linea','traces'),
    transactions = source('linea','transactions'),
    erc20_transfers = source('erc20_linea','evt_Transfer')
)
}}
