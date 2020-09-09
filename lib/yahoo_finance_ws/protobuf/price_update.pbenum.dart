///
//  Generated code. Do not modify.
//  source: lib/yahoo_finance_ws/protobuf/price_update.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PricingData_QuoteType extends $pb.ProtobufEnum {
  static const PricingData_QuoteType NONE = PricingData_QuoteType._(0, 'NONE');
  static const PricingData_QuoteType ALTSYMBOL = PricingData_QuoteType._(5, 'ALTSYMBOL');
  static const PricingData_QuoteType HEARTBEAT = PricingData_QuoteType._(7, 'HEARTBEAT');
  static const PricingData_QuoteType EQUITY = PricingData_QuoteType._(8, 'EQUITY');
  static const PricingData_QuoteType INDEX = PricingData_QuoteType._(9, 'INDEX');
  static const PricingData_QuoteType MUTUALFUND = PricingData_QuoteType._(11, 'MUTUALFUND');
  static const PricingData_QuoteType MONEYMARKET = PricingData_QuoteType._(12, 'MONEYMARKET');
  static const PricingData_QuoteType OPTION = PricingData_QuoteType._(13, 'OPTION');
  static const PricingData_QuoteType CURRENCY = PricingData_QuoteType._(14, 'CURRENCY');
  static const PricingData_QuoteType WARRANT = PricingData_QuoteType._(15, 'WARRANT');
  static const PricingData_QuoteType BOND = PricingData_QuoteType._(17, 'BOND');
  static const PricingData_QuoteType FUTURE = PricingData_QuoteType._(18, 'FUTURE');
  static const PricingData_QuoteType ETF = PricingData_QuoteType._(20, 'ETF');
  static const PricingData_QuoteType COMMODITY = PricingData_QuoteType._(23, 'COMMODITY');
  static const PricingData_QuoteType ECNQUOTE = PricingData_QuoteType._(28, 'ECNQUOTE');
  static const PricingData_QuoteType CRYPTOCURRENCY = PricingData_QuoteType._(41, 'CRYPTOCURRENCY');
  static const PricingData_QuoteType INDICATOR = PricingData_QuoteType._(42, 'INDICATOR');
  static const PricingData_QuoteType INDUSTRY = PricingData_QuoteType._(1000, 'INDUSTRY');

  static const $core.List<PricingData_QuoteType> values = <PricingData_QuoteType> [
    NONE,
    ALTSYMBOL,
    HEARTBEAT,
    EQUITY,
    INDEX,
    MUTUALFUND,
    MONEYMARKET,
    OPTION,
    CURRENCY,
    WARRANT,
    BOND,
    FUTURE,
    ETF,
    COMMODITY,
    ECNQUOTE,
    CRYPTOCURRENCY,
    INDICATOR,
    INDUSTRY,
  ];

  static final $core.Map<$core.int, PricingData_QuoteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PricingData_QuoteType valueOf($core.int value) => _byValue[value];

  const PricingData_QuoteType._($core.int v, $core.String n) : super(v, n);
}

class PricingData_MarketHours extends $pb.ProtobufEnum {
  static const PricingData_MarketHours PRE_MARKET = PricingData_MarketHours._(0, 'PRE_MARKET');
  static const PricingData_MarketHours REGULAR_MARKET = PricingData_MarketHours._(1, 'REGULAR_MARKET');
  static const PricingData_MarketHours POST_MARKET = PricingData_MarketHours._(2, 'POST_MARKET');
  static const PricingData_MarketHours EXTENDED_HOURS_MARKET = PricingData_MarketHours._(3, 'EXTENDED_HOURS_MARKET');

  static const $core.List<PricingData_MarketHours> values = <PricingData_MarketHours> [
    PRE_MARKET,
    REGULAR_MARKET,
    POST_MARKET,
    EXTENDED_HOURS_MARKET,
  ];

  static final $core.Map<$core.int, PricingData_MarketHours> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PricingData_MarketHours valueOf($core.int value) => _byValue[value];

  const PricingData_MarketHours._($core.int v, $core.String n) : super(v, n);
}

class PricingData_OptionType extends $pb.ProtobufEnum {
  static const PricingData_OptionType CALL = PricingData_OptionType._(0, 'CALL');
  static const PricingData_OptionType PUT = PricingData_OptionType._(1, 'PUT');

  static const $core.List<PricingData_OptionType> values = <PricingData_OptionType> [
    CALL,
    PUT,
  ];

  static final $core.Map<$core.int, PricingData_OptionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PricingData_OptionType valueOf($core.int value) => _byValue[value];

  const PricingData_OptionType._($core.int v, $core.String n) : super(v, n);
}

