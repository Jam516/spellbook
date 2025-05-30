{% set blockchain = 'berachain' %}

{{ config(
    schema = 'prices_' + blockchain,
    alias = 'tokens',
    materialized = 'table',
    file_format = 'delta',
    tags = ['static']
    )
}}

SELECT
    token_id
    , '{{ blockchain }}' as blockchain
    , symbol
    , contract_address
    , decimals
FROM
(
    VALUES
    ('bera-berachain', 'WBERA', 0x6969696969696969696969696969696969696969, 18)
    , ('usdce-usd-coine', 'USDC.e', 0x549943e04f40284185054145c6E4e9568C1D3241, 6)
    , ('weth-weth', 'WETH', 0x2F6F07CDcf3588944Bf4C42aC74ff24bF56e7590, 18)
    , ('weeth-wrapped-eeth', 'weETH', 0x7dcc39b4d1c53cb31e1abc0e358b43987fef80f7, 18)
    , ('wbtc-wrapped-bitcoin', 'WBTC', 0x0555E30da8f98308EdB960aa94C0Db47230d2B9c, 8)
    , ('lbtc-lombard-staked-btc', 'LBTC', 0xecAc9C5F704e954931349Da37F60E39f515c11c1, 8)
    , ('rseth-rseth', 'rsETH', 0x4186BFC76E2E237523CBC30FD220FE055156b41F, 18)
    , ('usde-ethena-usde', 'USDe', 0x5d3a1Ff2b6BAb83b63cd9AD0787074081a52ef34, 18)
    , ('usdt-tether', 'USD₮0', 0x779Ded0c9e1022225f8E0630b35a9b54bE713736, 6)
    , ('usdc-usd-coin', 'BYUSD', 0x688e72142674041f8f6Af4c808a4045cA1D6aC82, 6)
    , ('honey-honey1', 'HONEY', 0xfcbd14dc51f0a4d49d5e53c2e0950e0bc26d0dce, 18)
    , ('henlo1-henlo', 'HENLO', 0xb2f776e9c1c926c4b2e54182fac058da9af0b6a5, 18)
    , ('wgbera-wrapped-gbera', 'wgBERA', 0xd77552d3849ab4d8c3b189a9582d0ba4c1f4f912, 18)
    , ('jani-janitooor', 'JANI', 0x8f06863df59a042bcc2c86cc8ca1709ec1ee316b, 18)
    , ('yeet3-yeet', 'YEET', 0x08a38caa631de329ff2dad1656ce789f31af3142, 18)
    , ('ibgt-infrared-bgt', 'iBGT', 0xac03caba51e17c86c921e1f6cbfbdc91f8bb2e6b, 18)
    , ('usdbr-usdbr', 'USDBr', 0x6d4223dae2a8744a85a6d44e97f3f61679f87ee6, 18)
) as temp (token_id, symbol, contract_address, decimals) 
