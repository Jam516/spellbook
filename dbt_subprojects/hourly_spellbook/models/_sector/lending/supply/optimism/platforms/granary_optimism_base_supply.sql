{{
  config(
    schema = 'granary_optimism',
    alias = 'base_supply',
    materialized = 'incremental',
    file_format = 'delta',
    incremental_strategy = 'merge',
    unique_key = ['transaction_type', 'token_address', 'tx_hash', 'evt_index'],
    incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')]
  )
}}

{{
  lending_aave_v2_compatible_supply(
    blockchain = 'optimism',
    project = 'granary',
    version = '1',
    project_decoded_as = 'the_granary',
    wrapped_token_gateway_available = false
  )
}}
