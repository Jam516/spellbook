{{ config(
        
        schema = 'nft_bnb',
        alias ='transfers',
        partition_by=['block_month'],
        materialized='incremental',
        file_format = 'delta',
        incremental_strategy = 'merge',
        incremental_predicates = [incremental_predicate('DBT_INTERNAL_DEST.block_time')],
        unique_key = ['tx_hash', 'evt_index', 'token_id', 'amount']
)
}}

{{nft_transfers(
    blockchain='bnb'
    , base_transactions = source('bnb','transactions')
    , erc721_transfers = source('erc721_bnb','evt_Transfer')
    , erc1155_single = source('erc1155_bnb','evt_TransferSingle')
    , erc1155_batch = source('erc1155_bnb', 'evt_TransferBatch')
)}}
