///
//  Generated code. Do not modify.
//  source: lib/yahoo_finance_ws/protobuf/price_update.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const PricingData$json = const {
  '1': 'PricingData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'price', '3': 2, '4': 1, '5': 2, '10': 'price'},
    const {'1': 'time', '3': 3, '4': 1, '5': 18, '10': 'time'},
    const {'1': 'currency', '3': 4, '4': 1, '5': 9, '10': 'currency'},
    const {'1': 'exchange', '3': 5, '4': 1, '5': 9, '10': 'exchange'},
    const {'1': 'changePercent', '3': 8, '4': 1, '5': 2, '10': 'changePercent'},
    const {'1': 'dayVolume', '3': 9, '4': 1, '5': 2, '10': 'dayVolume'},
    const {'1': 'dayHigh', '3': 10, '4': 1, '5': 2, '10': 'dayHigh'},
    const {'1': 'dayLow', '3': 11, '4': 1, '5': 2, '10': 'dayLow'},
    const {'1': 'change', '3': 12, '4': 1, '5': 2, '10': 'change'},
    const {'1': 'shortName', '3': 13, '4': 1, '5': 9, '10': 'shortName'},
    const {'1': 'expireDate', '3': 14, '4': 1, '5': 18, '10': 'expireDate'},
    const {'1': 'openPrice', '3': 15, '4': 1, '5': 2, '10': 'openPrice'},
    const {'1': 'previousClose', '3': 16, '4': 1, '5': 2, '10': 'previousClose'},
    const {'1': 'strikePrice', '3': 17, '4': 1, '5': 2, '10': 'strikePrice'},
    const {'1': 'underlyingSymbol', '3': 18, '4': 1, '5': 9, '10': 'underlyingSymbol'},
    const {'1': 'openInterest', '3': 19, '4': 1, '5': 18, '10': 'openInterest'},
    const {'1': 'miniOption', '3': 21, '4': 1, '5': 18, '10': 'miniOption'},
    const {'1': 'lastSize', '3': 22, '4': 1, '5': 18, '10': 'lastSize'},
    const {'1': 'bid', '3': 23, '4': 1, '5': 2, '10': 'bid'},
    const {'1': 'bidSize', '3': 24, '4': 1, '5': 18, '10': 'bidSize'},
    const {'1': 'ask', '3': 25, '4': 1, '5': 2, '10': 'ask'},
    const {'1': 'askSize', '3': 26, '4': 1, '5': 18, '10': 'askSize'},
    const {'1': 'priceHint', '3': 27, '4': 1, '5': 18, '10': 'priceHint'},
    const {'1': 'vol_24hr', '3': 28, '4': 1, '5': 18, '10': 'vol24hr'},
    const {'1': 'volAllCurrencies', '3': 29, '4': 1, '5': 18, '10': 'volAllCurrencies'},
    const {'1': 'fromcurrency', '3': 30, '4': 1, '5': 9, '10': 'fromcurrency'},
    const {'1': 'lastMarket', '3': 31, '4': 1, '5': 9, '10': 'lastMarket'},
    const {'1': 'circulatingSupply', '3': 32, '4': 1, '5': 1, '10': 'circulatingSupply'},
    const {'1': 'marketcap', '3': 33, '4': 1, '5': 1, '10': 'marketcap'},
    const {'1': 'quoteType', '3': 6, '4': 1, '5': 14, '6': '.PricingData.QuoteType', '10': 'quoteType'},
    const {'1': 'marketHours', '3': 7, '4': 1, '5': 14, '6': '.PricingData.MarketHours', '10': 'marketHours'},
    const {'1': 'optionsType', '3': 20, '4': 1, '5': 14, '6': '.PricingData.OptionType', '10': 'optionsType'},
  ],
  '4': const [PricingData_QuoteType$json, PricingData_MarketHours$json, PricingData_OptionType$json],
};

const PricingData_QuoteType$json = const {
  '1': 'QuoteType',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'ALTSYMBOL', '2': 5},
    const {'1': 'HEARTBEAT', '2': 7},
    const {'1': 'EQUITY', '2': 8},
    const {'1': 'INDEX', '2': 9},
    const {'1': 'MUTUALFUND', '2': 11},
    const {'1': 'MONEYMARKET', '2': 12},
    const {'1': 'OPTION', '2': 13},
    const {'1': 'CURRENCY', '2': 14},
    const {'1': 'WARRANT', '2': 15},
    const {'1': 'BOND', '2': 17},
    const {'1': 'FUTURE', '2': 18},
    const {'1': 'ETF', '2': 20},
    const {'1': 'COMMODITY', '2': 23},
    const {'1': 'ECNQUOTE', '2': 28},
    const {'1': 'CRYPTOCURRENCY', '2': 41},
    const {'1': 'INDICATOR', '2': 42},
    const {'1': 'INDUSTRY', '2': 1000},
  ],
};

const PricingData_MarketHours$json = const {
  '1': 'MarketHours',
  '2': const [
    const {'1': 'PRE_MARKET', '2': 0},
    const {'1': 'REGULAR_MARKET', '2': 1},
    const {'1': 'POST_MARKET', '2': 2},
    const {'1': 'EXTENDED_HOURS_MARKET', '2': 3},
  ],
};

const PricingData_OptionType$json = const {
  '1': 'OptionType',
  '2': const [
    const {'1': 'CALL', '2': 0},
    const {'1': 'PUT', '2': 1},
  ],
};

