import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/models/live_price_chart_model/bitcoin_live_price_chart_model.dart';
import 'package:btcapp/providers/bitcoin_live_price_provider/bitcoin_live_price_chart_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LivePriceDetailsScreen extends StatefulWidget {
  const LivePriceDetailsScreen({super.key});

  @override
  State<LivePriceDetailsScreen> createState() => _LivePriceDetailsScreenState();
}

class _LivePriceDetailsScreenState extends State<LivePriceDetailsScreen> {
  String _selectedTimeFrame = '1 Hour'; // Initial selected value
  List<String> timeFrameList = ['1 Hour', '3 Hour', '6 Hour', '12 Hour'];

  _LivePriceDetailsScreenState();

  @override
  void initState() {
    super.initState();
    // Fetch initial data
    Provider.of<BitcoinLivePriceChartProvider>(context, listen: false)
        .fetchBitcoinPriceData('bitcoin', 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<AppThemeProvider>(context).backgroundColor,
        title: Text(
          'Live Price',
          style: TextStyle(
              color: Provider.of<AppThemeProvider>(context).textColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Provider.of<AppThemeProvider>(context).textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Provider.of<AppThemeProvider>(context).textColor,
            ),
            onPressed: () {
              // Add your onPressed logic here
            },
          ),
        ],
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                _buildChartSection(context),
                const SizedBox(height: 20),
                _buildDetailsSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'BitCoin',
              style: TextStyle(
                color: Provider.of<AppThemeProvider>(context).textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Provider.of<AppThemeProvider>(context)
                    .livePriceGrowthTextBackgroundColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '+20%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Provider.of<AppThemeProvider>(context)
                      .livePriceGrowthTextColor,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Provider.of<AppThemeProvider>(context)
                .livePriceTimeBackgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: false,
              items: timeFrameList
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14,
                            color: Provider.of<AppThemeProvider>(context)
                                .livePriceTimeTextColor,
                          ),
                        ),
                      ))
                  .toList(),
              value: _selectedTimeFrame,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimeFrame = newValue!;
                  // Update data based on selected timeframe
                  int hour;
                  switch (_selectedTimeFrame) {
                    case '1 Hour':
                      hour = 1; // half a day
                      break;
                    case '3 Hour':
                      hour = 3;
                      break;
                    case '6 Hour':
                      hour = 6;
                      break;
                    case '12 Hour':
                      hour = 12;
                      break;
                    default:
                      hour = 1;
                  }
                  Provider.of<BitcoinLivePriceChartProvider>(context,
                          listen: false)
                      .fetchBitcoinPriceData('bitcoin', hour);
                });
              },
              buttonStyleData: const ButtonStyleData(
                //padding: EdgeInsets.symmetric(horizontal: 16),
                height: 30,
                //width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChartSection(BuildContext context) {
    return Consumer<BitcoinLivePriceChartProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (provider.errorMessage != null) {
          return Center(child: Text(provider.errorMessage!));
        } else {
          return SizedBox(
            height: 250,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
              primaryXAxis: DateTimeAxis(
                  dateFormat: DateFormat.MMMd(),
                  majorGridLines: const MajorGridLines(width: 0)),
              primaryYAxis: NumericAxis(
                  minimum: provider.priceData.isNotEmpty
                      ? provider.priceData
                          .map((e) => e.low.toDouble())
                          .reduce((a, b) => a < b ? a : b)
                      : 0,
                  maximum: provider.priceData.isNotEmpty
                      ? provider.priceData
                          .map((e) => e.high.toDouble())
                          .reduce((a, b) => a > b ? a : b)
                      : 100,
                  interval: (provider.priceData.isNotEmpty
                          ? provider.priceData
                                  .map((e) => e.high.toDouble())
                                  .reduce((a, b) => a > b ? a : b) -
                              provider.priceData
                                  .map((e) => e.low.toDouble())
                                  .reduce((a, b) => a < b ? a : b)
                          : 100) /
                      5,
                  labelFormat: r'${value}',
                  axisLine: const AxisLine(width: 0)),
              series: [
                CandleSeries<BitcoinLivePriceChartModel, DateTime>(
                  enableSolidCandles: true,
                  dataSource: provider.priceData,
                  xValueMapper: (BitcoinLivePriceChartModel data, _) =>
                      DateTime.fromMillisecondsSinceEpoch(data.timestamp),
                  lowValueMapper: (BitcoinLivePriceChartModel data, _) =>
                      data.low.toDouble(),
                  highValueMapper: (BitcoinLivePriceChartModel data, _) =>
                      data.high.toDouble(),
                  openValueMapper: (BitcoinLivePriceChartModel data, _) =>
                      data.open.toDouble(),
                  closeValueMapper: (BitcoinLivePriceChartModel data, _) =>
                      data.close.toDouble(),
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildDetailsSection(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    color: Provider.of<AppThemeProvider>(context).textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(const Size(120, 28)),
                    visualDensity: VisualDensity.compact,
                    elevation: WidgetStateProperty.all(0),
                    backgroundColor: WidgetStateProperty.all(
                        appThemeProvider.livePriceViewMarketButtonColor),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                          side: BorderSide(
                              color: appThemeProvider
                                  .livePriceViewMarketButtonBorderColor)),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'View Market',
                    style: TextStyle(
                      color:
                          appThemeProvider.livePriceViewMarketButtonTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildDetailItem(context, 'Market Cap', '\$1.2 Trillion', '',
                '57% of Crypto Market'),
            _buildDetailItem(context, 'Volume(24h)', '\$57,755,997,955',
                '+18.24%', '865,920 BTC'),
            _buildDetailItem(context, 'Circulating Supply', '1.2 Trillion', '',
                '62% of Total Supply'),
            _buildDetailItem(
                context, 'All time High', '\$56,000', '', 'May 2024'),
            _buildDetailItem(context, 'Cycle Low', '\$56,000', '', 'May 2024'),
            _buildDetailItem(
                context, 'Performance', '', '+18.34%', 'Past Year'),
          ],
        );
      },
    );
  }

  Widget _buildDetailItem(BuildContext context, String title, String value,
      String growth, String subtitle) {
    return Card.filled(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Provider.of<AppThemeProvider>(context).textColor),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Provider.of<AppThemeProvider>(context)
                      .textColor
                      .withOpacity(0.6)),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 22,
                    color: Provider.of<AppThemeProvider>(context)
                        .livePriceItemColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  growth,
                  style: TextStyle(
                    fontSize: 14,
                    color: growth.startsWith('+') ? Colors.green : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 0.3, color: Colors.grey[500]),
        ],
      ),
    );
  }
}

class ChartSampleData {
  ChartSampleData({this.x, this.open, this.high, this.low, this.close});

  final DateTime? x;
  final double? open;
  final double? high;
  final double? low;
  final double? close;
}
