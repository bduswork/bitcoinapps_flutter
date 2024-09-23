// bitcoin_live_price_chart_provider.dart
import 'package:btcapp/service/live_price_service/bitcoin_live_price_chart_service.dart';
import 'package:flutter/material.dart';
import 'package:btcapp/models/live_price_chart_model/bitcoin_live_price_chart_model.dart';

class BitcoinLivePriceChartProvider with ChangeNotifier {
  List<BitcoinLivePriceChartModel> _priceData = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<BitcoinLivePriceChartModel> get priceData => _priceData;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final BitcoinLivePriceChartService _service = BitcoinLivePriceChartService();

  Future<void> fetchBitcoinPriceData(String id, int days) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _priceData = await _service.fetchBitcoinPriceData(id, days);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
