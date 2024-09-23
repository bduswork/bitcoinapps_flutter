import 'dart:convert';
import 'package:btcapp/models/live_price_chart_model/bitcoin_live_price_chart_model.dart';
import 'package:http/http.dart' as http;

class BitcoinLivePriceChartService {
  //final String apiKey = 'YOUR_API_KEY';

  Future<List<BitcoinLivePriceChartModel>> fetchBitcoinPriceData(
      String id, int hour) async {
    final String apiUrl =
        //'https://pro-api.coingecko.com/api/v3/coins/$id/ohlc?vs_currency=usd&days=$days';
        'https://api.coingecko.com/api/v3/coins/$id/ohlc?days=1&vs_currency=usd&hour=$hour';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData
          .map((data) => BitcoinLivePriceChartModel.fromJson(data))
          .toList();
    } else {
      throw Exception('Failed to load Bitcoin price data');
    }
  }
}
