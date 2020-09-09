part of api_hacks;

const YAHOO_FINANCE_WS_ENDPOINT = "wss://streamer.finance.yahoo.com/";

class YahooWSTicker {
  static YahooWSTicker instance = YahooWSTicker._();

  final Map<String, StreamController> _streamControllerMap = {};
  final Map<String, StreamSubscription> _streamListenerMap = {};

  final BehaviorSubject<PriceUpdate> _controller = BehaviorSubject();
  final WebSocketChannel _channel =
      WebSocketChannel.connect(Uri.parse(YAHOO_FINANCE_WS_ENDPOINT));

  StreamSubscription<PriceUpdate> _controllerListener;

  YahooWSTicker._() {
    _controllerListener = _channel.stream
        .map<PriceUpdate>((event) => PriceUpdate.fromProto3Json(
            PricingData.fromBuffer(base64.decode(event.toString()))
                .toProto3Json()))
        .listen((event) {
      _controller.add(event);
    });
  }

  factory YahooWSTicker() {
    return YahooWSTicker.instance;
  }

  Stream<PriceUpdate> watch(String id) {
    var newStreamController = BehaviorSubject<PriceUpdate>();

    _streamControllerMap[id] = newStreamController;

    _streamListenerMap[id] =
        _controller.stream.where((event) => event.id == id).listen((event) {
      newStreamController.add(event);
    });

    _subscribe(id);

    return newStreamController.stream;
  }

  void _subscribe(String id) {
    _channel.sink.add(json.encode({
      'subscribe': [id]
    }));
  }

  void _unsubscribe(String id) {
    _channel.sink.add(json.encode({
      'unsubscribe': [id]
    }));
  }

  Future<void> unwatch(String id) async {
    _unsubscribe(id);

    await _streamListenerMap[id].cancel();
    await _streamControllerMap[id].close();

    _streamListenerMap.remove(id);
    _streamControllerMap.remove(id);
  }

  Future<void> dispose() async {
    await Future.value(_streamListenerMap.keys.map((key) async {
      await _streamListenerMap[key].cancel();
      await _streamControllerMap[key].close();
      _unsubscribe(key);
    }));

    await _channel.sink.close();
    await _controllerListener.cancel();
    await _controller.close();
  }
}

//get enum name
String getEnumName(e) {
  return e.toString().substring(e.toString().indexOf('.') + 1);
}

class PriceUpdate {
  final String id;
  final double price;
  final int time;
  final String currency;
  final String exchange;
  final double changePercent;
  final double dayVolume;
  final double dayHigh;
  final double dayLow;
  final double change;
  final String shortName;
  final int expireDate;
  final double openPrice;
  final double previousClose;
  final double strikePrice;
  final String underlyingSymbol;
  final int openInterest;
  final int miniOption;
  final int lastSize;
  final double bid;
  final int bidSize;
  final double ask;
  final int askSize;
  final int priceHint;
  final int vol_24hr;
  final int volAllCurrencies;
  final String fromcurrency;
  final String lastMarket;
  final double circulatingSupply;
  final double marketcap;
  final QuoteType quoteType;
  final MarketHours marketHours;
  final OptionType optionType;

  PriceUpdate({
    this.id = "",
    this.price = 0,
    this.time = 0,
    this.currency = "",
    this.exchange = "",
    this.changePercent = 0,
    this.dayVolume = 0,
    this.dayHigh = 0,
    this.dayLow = 0,
    this.change = 0,
    this.shortName = "",
    this.expireDate = 0,
    this.openPrice = 0,
    this.previousClose = 0,
    this.strikePrice = 0,
    this.underlyingSymbol,
    this.openInterest = 0,
    this.miniOption = 0,
    this.lastSize = 0,
    this.bid = 0,
    this.bidSize = 0,
    this.ask = 0,
    this.askSize = 0,
    this.priceHint = 0,
    this.vol_24hr = 0,
    this.volAllCurrencies = 0,
    this.fromcurrency = "",
    this.lastMarket = "",
    this.circulatingSupply = 0,
    this.marketcap = 0,
    this.quoteType = null,
    this.marketHours = null,
    this.optionType = null,
  });

  PriceUpdate copyWith({
    String id,
    double price,
    int time,
    String currency,
    String exchange,
    double changePercent,
    double dayVolume,
    double dayHigh,
    double dayLow,
    double change,
    String shortName,
    int expireDate,
    double openPrice,
    double previousClose,
    double strikePrice,
    String underlyingSymbol,
    int openInterest,
    int miniOption,
    int lastSize,
    double bid,
    int bidSize,
    double ask,
    int askSize,
    int priceHint,
    int vol_24hr,
    int volAllCurrencies,
    String fromcurrency,
    String lastMarket,
    double circulatingSupply,
    double marketcap,
    QuoteType quoteType,
    MarketHours marketHours,
    OptionType optionType,
  }) {
    return PriceUpdate(
      id: id ?? this.id,
      price: price ?? this.price,
      time: time ?? this.time,
      currency: currency ?? this.currency,
      exchange: exchange ?? this.exchange,
      changePercent: changePercent ?? this.changePercent,
      dayVolume: dayVolume ?? this.dayVolume,
      dayHigh: dayHigh ?? this.dayHigh,
      dayLow: dayLow ?? this.dayLow,
      change: change ?? this.change,
      shortName: shortName ?? this.shortName,
      expireDate: expireDate ?? this.expireDate,
      openPrice: openPrice ?? this.openPrice,
      previousClose: previousClose ?? this.previousClose,
      strikePrice: strikePrice ?? this.strikePrice,
      underlyingSymbol: underlyingSymbol ?? this.underlyingSymbol,
      openInterest: openInterest ?? this.openInterest,
      miniOption: miniOption ?? this.miniOption,
      lastSize: lastSize ?? this.lastSize,
      bid: bid ?? this.bid,
      bidSize: bidSize ?? this.bidSize,
      ask: ask ?? this.ask,
      askSize: askSize ?? this.askSize,
      priceHint: priceHint ?? this.priceHint,
      vol_24hr: vol_24hr ?? this.vol_24hr,
      volAllCurrencies: volAllCurrencies ?? this.volAllCurrencies,
      fromcurrency: fromcurrency ?? this.fromcurrency,
      lastMarket: lastMarket ?? this.lastMarket,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      marketcap: marketcap ?? this.marketcap,
      quoteType: quoteType ?? this.quoteType,
      marketHours: marketHours ?? this.marketHours,
      optionType: optionType ?? this.optionType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'time': time,
      'currency': currency,
      'exchange': exchange,
      'changePercent': changePercent,
      'dayVolume': dayVolume,
      'dayHigh': dayHigh,
      'dayLow': dayLow,
      'change': change,
      'shortName': shortName,
      'expireDate': expireDate,
      'openPrice': openPrice,
      'previousClose': previousClose,
      'strikePrice': strikePrice,
      'underlyingSymbol': underlyingSymbol,
      'openInterest': openInterest,
      'miniOption': miniOption,
      'lastSize': lastSize,
      'bid': bid,
      'bidSize': bidSize,
      'ask': ask,
      'askSize': askSize,
      'priceHint': priceHint,
      'vol_24hr': vol_24hr,
      'volAllCurrencies': volAllCurrencies,
      'fromcurrency': fromcurrency,
      'lastMarket': lastMarket,
      'circulatingSupply': circulatingSupply,
      'marketcap': marketcap,
      'quoteType': getEnumName(quoteType),
      'marketHours': getEnumName(marketHours),
      'optionType': getEnumName(optionType),
    };
  }

  factory PriceUpdate.fromProto3Json(Map<String, dynamic> map) {
    if (map == null) return null;

    map.keys.forEach((element) {
      if (map[element] is String) {
        var val = num.tryParse(map[element]);
        if (val != null) map[element] = val;
      }
    });

    return PriceUpdate.fromMap(map);
  }

  factory PriceUpdate.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PriceUpdate(
        id: map['id'] ?? "",
        price: map['price'] ?? 0,
        time: map['time'] ?? 0,
        currency: map['currency'] ?? "",
        exchange: map['exchange'] ?? "",
        changePercent: map['changePercent'] ?? 0,
        dayVolume: map['dayVolume'] ?? 0,
        dayHigh: map['dayHigh'] ?? 0,
        dayLow: map['dayLow'] ?? 0,
        change: map['change'] ?? 0,
        shortName: map['shortName'] ?? "",
        expireDate: map['expireDate'] ?? 0,
        openPrice: map['openPrice'] ?? 0,
        previousClose: map['previousClose'] ?? 0,
        strikePrice: map['strikePrice'] ?? 0,
        underlyingSymbol: map['underlyingSymbol'] ?? "",
        openInterest: map['openInterest'] ?? 0,
        miniOption: map['miniOption'] ?? 0,
        lastSize: map['lastSize'] ?? 0,
        bid: map['bid'] ?? 0,
        bidSize: map['bidSize'] ?? 0,
        ask: map['ask'] ?? 0,
        askSize: map['askSize'] ?? 0,
        priceHint: map['priceHint'] ?? 0,
        vol_24hr: map['vol_24hr'] ?? 0,
        volAllCurrencies: map['volAllCurrencies'] ?? 0,
        fromcurrency: map['fromcurrency'] ?? "",
        lastMarket: map['lastMarket'] ?? "",
        circulatingSupply: map['circulatingSupply'] ?? 0,
        marketcap: map['marketcap'] ?? 0,
        quoteType: map['quoteType'] != null
            ? QuoteType.values
                .firstWhere((e) => getEnumName(e) == map['quoteType'])
            : null,
        marketHours: map['marketHours'] != null
            ? MarketHours.values
                .firstWhere((e) => getEnumName(e) == map['marketHours'])
            : null,
        optionType: map['optionType'] != null
            ? OptionType.values
                .firstWhere((e) => getEnumName(e) == map['optionType'])
            : null);
  }

  String toJson() => json.encode(toMap());

  factory PriceUpdate.fromJson(String source) =>
      PriceUpdate.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PriceUpdate(id: $id, price: $price, time: $time, currency: $currency, exchange: $exchange, changePercent: $changePercent, dayVolume: $dayVolume, dayHigh: $dayHigh, dayLow: $dayLow, change: $change, shortName: $shortName, expireDate: $expireDate, openPrice: $openPrice, previousClose: $previousClose, strikePrice: $strikePrice, underlyingSymbol: $underlyingSymbol, openInterest: $openInterest, miniOption: $miniOption, lastSize: $lastSize, bid: $bid, bidSize: $bidSize, ask: $ask, askSize: $askSize, priceHint: $priceHint, vol_24hr: $vol_24hr, volAllCurrencies: $volAllCurrencies, fromcurrency: $fromcurrency, lastMarket: $lastMarket, circulatingSupply: $circulatingSupply, marketcap: $marketcap, quoteType: $quoteType, marketHours: $marketHours, optionType: $optionType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PriceUpdate &&
        o.id == id &&
        o.price == price &&
        o.time == time &&
        o.currency == currency &&
        o.exchange == exchange &&
        o.changePercent == changePercent &&
        o.dayVolume == dayVolume &&
        o.dayHigh == dayHigh &&
        o.dayLow == dayLow &&
        o.change == change &&
        o.shortName == shortName &&
        o.expireDate == expireDate &&
        o.openPrice == openPrice &&
        o.previousClose == previousClose &&
        o.strikePrice == strikePrice &&
        o.underlyingSymbol == underlyingSymbol &&
        o.openInterest == openInterest &&
        o.miniOption == miniOption &&
        o.lastSize == lastSize &&
        o.bid == bid &&
        o.bidSize == bidSize &&
        o.ask == ask &&
        o.askSize == askSize &&
        o.priceHint == priceHint &&
        o.vol_24hr == vol_24hr &&
        o.volAllCurrencies == volAllCurrencies &&
        o.fromcurrency == fromcurrency &&
        o.lastMarket == lastMarket &&
        o.circulatingSupply == circulatingSupply &&
        o.marketcap == marketcap &&
        o.quoteType == quoteType &&
        o.marketHours == marketHours &&
        o.optionType == optionType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        time.hashCode ^
        currency.hashCode ^
        exchange.hashCode ^
        changePercent.hashCode ^
        dayVolume.hashCode ^
        dayHigh.hashCode ^
        dayLow.hashCode ^
        change.hashCode ^
        shortName.hashCode ^
        expireDate.hashCode ^
        openPrice.hashCode ^
        previousClose.hashCode ^
        strikePrice.hashCode ^
        underlyingSymbol.hashCode ^
        openInterest.hashCode ^
        miniOption.hashCode ^
        lastSize.hashCode ^
        bid.hashCode ^
        bidSize.hashCode ^
        ask.hashCode ^
        askSize.hashCode ^
        priceHint.hashCode ^
        vol_24hr.hashCode ^
        volAllCurrencies.hashCode ^
        fromcurrency.hashCode ^
        lastMarket.hashCode ^
        circulatingSupply.hashCode ^
        marketcap.hashCode ^
        quoteType.hashCode ^
        marketHours.hashCode ^
        optionType.hashCode;
  }
}

enum QuoteType {
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
  INDUSTRY
}

enum MarketHours {
  PRE_MARKET,
  REGULAR_MARKET,
  POST_MARKET,
  EXTENDED_HOURS_MARKET
}

enum OptionType { CALL, PUT }
