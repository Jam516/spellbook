{{ config(
    schema = 'uniswap_v4_optimism'
    , alias = 'pools'
    , materialized = 'incremental'
    , file_format = 'delta'
    , incremental_strategy = 'merge'
    , unique_key = ['id', 'blockchain']
    , incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.creation_block_time')]
    )
}}

{{
    uniswap_compatible_v4_liquidity_pools(
          blockchain = 'optimism'
        , project = 'uniswap'
        , version = '4'
        , PoolManager_evt_Initialize = source('uniswap_v4_optimism', 'PoolManager_evt_Initialize')
    )
}}