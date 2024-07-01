import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/views/blocks_details/exp.dart';
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
  List<String> timeFrameList = ['1 Hour', '12 Hour', '1 Day', '7 Day'];

  /// It returns the candle series to the chart.
  List<CandleSeries<ChartSampleData, DateTime>> _getCandleSeries() {
    return <CandleSeries<ChartSampleData, DateTime>>[
      CandleSeries<ChartSampleData, DateTime>(
        enableSolidCandles: true,
        dataSource: <ChartSampleData>[
          ChartSampleData(
              x: DateTime(2022, 06, 01),
              open: 148.86,
              high: 151.74,
              low: 147.68,
              close: 151.21),
          ChartSampleData(
              x: DateTime(2022, 06, 02),
              open: 150.17,
              high: 151.27,
              low: 147.83,
              close: 148.71),
          ChartSampleData(
              x: DateTime(2022, 06, 03),
              open: 147.83,
              high: 148.91,
              low: 144.46,
              close: 145.38),
          ChartSampleData(
              x: DateTime(2022, 06, 06),
              open: 147.03,
              high: 148.57,
              low: 144.9,
              close: 146.14),
          ChartSampleData(
              x: DateTime(2022, 06, 07),
              open: 148.22,
              high: 149.0,
              low: 146.31,
              close: 148.71),
          ChartSampleData(
              x: DateTime(2022, 06, 08),
              open: 148.86,
              high: 149.87,
              low: 147.46,
              close: 148.71),
          ChartSampleData(
              x: DateTime(2022, 06, 09),
              open: 147.08,
              high: 147.95,
              low: 142.53,
              close: 142.64),
          ChartSampleData(
              x: DateTime(2022, 06, 10),
              open: 142.53,
              high: 145.18,
              low: 140.52,
              close: 141.66),
          ChartSampleData(
              x: DateTime(2022, 06, 13),
              open: 140.03,
              high: 144.34,
              low: 139.2,
              close: 142.45),
          ChartSampleData(
              x: DateTime(2022, 06, 14),
              open: 145.25,
              high: 146.44,
              low: 141.67,
              close: 141.66),
          ChartSampleData(
              x: DateTime(2022, 06, 15),
              open: 135.87,
              high: 137.46,
              low: 132.16,
              close: 135.43),
          ChartSampleData(
              x: DateTime(2022, 06, 16),
              open: 133.13,
              high: 135.3,
              low: 131.44,
              close: 132.16),
          ChartSampleData(
              x: DateTime(2022, 06, 17),
              open: 130.07,
              high: 133.08,
              low: 129.81,
              close: 131.56),
          ChartSampleData(
              x: DateTime(2022, 06, 21),
              open: 133.13,
              high: 135.45,
              low: 132.32,
              close: 134.48),
          ChartSampleData(
              x: DateTime(2022, 06, 22),
              open: 133.77,
              high: 135.25,
              low: 133.21,
              close: 135.21),
          ChartSampleData(
              x: DateTime(2022, 06, 23),
              open: 134.78,
              high: 136.88,
              low: 133.95,
              close: 135.76),
          ChartSampleData(
              x: DateTime(2022, 06, 24),
              open: 138.1,
              high: 139.68,
              low: 137.06,
              close: 138.93),
          ChartSampleData(
              x: DateTime(2022, 06, 27),
              open: 141.56,
              high: 143.49,
              low: 141.01,
              close: 141.66),
          ChartSampleData(
              x: DateTime(2022, 06, 28),
              open: 139.02,
              high: 140.38,
              low: 136.82,
              close: 137.44),
          ChartSampleData(
              x: DateTime(2022, 06, 29),
              open: 137.46,
              high: 140.87,
              low: 136.64,
              close: 139.23),
          ChartSampleData(
              x: DateTime(2022, 06, 30),
              open: 136.82,
              high: 137.41,
              low: 133.77,
              close: 134.18),
        ],
        name: 'AAPL',
        xValueMapper: (ChartSampleData sales, _) => sales.x as DateTime,
        lowValueMapper: (ChartSampleData sales, _) => sales.low,
        highValueMapper: (ChartSampleData sales, _) => sales.high,
        openValueMapper: (ChartSampleData sales, _) => sales.open,
        closeValueMapper: (ChartSampleData sales, _) => sales.close,
      )
    ];
  }

  _LivePriceDetailsScreenState();
  late bool _enableSolidCandle;
  late bool _toggleVisibility;
  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _enableSolidCandle = true;
    _toggleVisibility = true;
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
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

          // DropdownButton<String>(
          //   value: _selectedTimeFrame,
          //   dropdownColor: Colors.grey[800],
          //   style: TextStyle(
          //     fontSize: 14,
          //     fontWeight: FontWeight.bold,
          //     color:
          //         Provider.of<AppThemeProvider>(context).livePriceTimeTextColor,
          //   ),
          //   underline: Container(),
          //   isDense: true,
          //   items: timeFrameList.map<DropdownMenuItem<String>>((String value) {
          //     return DropdownMenuItem<String>(
          //       value: value,
          //       child: Text(value),
          //     );
          //   }).toList(),
          //   onChanged: (String? newValue) {
          //     setState(() {
          //       _selectedTimeFrame = newValue!;
          //     });
          //   },
          // ),
          //////////////////
          ///
          ///
        ),
      ],
    );
  }

  Widget _buildChartSection(BuildContext context) {
    // Dummy chart representation
    return SizedBox(
        height: 250,
        //width: 320,
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          // title: ChartTitle(text: isCardView ? '' : 'AAPL - 2016'),
          primaryXAxis: DateTimeAxis(
              dateFormat: DateFormat.MMMd(),
              //interval: 2,
              //intervalType: DateTimeIntervalType.months,
              //minimum: DateTime(2016),
              //maximum: DateTime(2016, 10),
              majorGridLines: const MajorGridLines(width: 0)),
          primaryYAxis: const NumericAxis(
              minimum: 130,
              maximum: 155,
              interval: 5,
              labelFormat: r'${value}',
              axisLine: AxisLine(width: 0)),
          series: _getCandleSeries(),
          //trackballBehavior: _trackballBehavior,
        ));
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
      //margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            //visualDensity: VisualDensity.compact,
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
