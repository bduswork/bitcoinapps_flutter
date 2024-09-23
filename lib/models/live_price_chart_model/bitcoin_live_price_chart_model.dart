class BitcoinLivePriceChartModel {
  final int timestamp;
  final double open;
  final double high;
  final double low;
  final double close;

  BitcoinLivePriceChartModel({
    required this.timestamp,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory BitcoinLivePriceChartModel.fromJson(List<dynamic> json) {
    return BitcoinLivePriceChartModel(
      timestamp: json[0],
      open: json[1],
      high: json[2],
      low: json[3],
      close: json[4],
    );
  }

  List<dynamic> toJson() {
    return [timestamp, open, high, low, close];
  }

  @override
  String toString() {
    return 'BitcoinLivePriceChartModel(timestamp: $timestamp, open: $open, high: $high, low: $low, close: $close)';
  }
}
