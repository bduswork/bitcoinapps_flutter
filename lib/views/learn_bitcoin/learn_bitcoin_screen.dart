import 'dart:io';
import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LearnBitcoinScreen extends StatefulWidget {
  const LearnBitcoinScreen({super.key});

  @override
  State<LearnBitcoinScreen> createState() => _LearnBitcoinScreenState();
}

class _LearnBitcoinScreenState extends State<LearnBitcoinScreen> {
  String selectedOption = '';
  VideoPlayerController? _controller;
  ChewieController? _chewieController;
  bool _isConnected = false;
  bool isDescriptionExpanded = false;
  String selectedLabel = "Basics";

  @override
  void initState() {
    super.initState();
    _checkInternetConnection().then((connected) {
      setState(() async {
        _isConnected = connected;
        if (_isConnected) {
          _controller = VideoPlayerController.networkUrl(Uri.parse(
              'https://drive.google.com/uc?export=download&id=1eO1dwFu1GY66N8cEckRmIBT7mMNnQlnJ'));
          // Preload video metadata
          await _controller?.initialize();
          // Now initialize ChewieController
          setState(() {
            _chewieController = ChewieController(
              videoPlayerController: _controller!,
              aspectRatio: 16 / 9,
              autoInitialize: true,
              looping: true,
              allowFullScreen: true,
              allowMuting: true,
              fullScreenByDefault: false,
              deviceOrientationsOnEnterFullScreen: [
                DeviceOrientation.landscapeRight,
                DeviceOrientation.landscapeLeft,
              ],
              deviceOrientationsAfterFullScreen: [
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ],
            );
          });
          // Preload video metadata

          // ..initialize().then((_) {
          //   setState(() {
          //     _chewieController = ChewieController(
          //       videoPlayerController: _controller!,
          //       aspectRatio: 16 / 9,
          //       autoInitialize: true,
          //       looping: true,
          //       allowFullScreen: true,
          //       allowMuting: true,
          //       fullScreenByDefault: false,
          //       deviceOrientationsOnEnterFullScreen: [
          //         DeviceOrientation.landscapeRight,
          //         DeviceOrientation.landscapeLeft,
          //       ],
          //       deviceOrientationsAfterFullScreen: [
          //         DeviceOrientation.portraitUp,
          //         DeviceOrientation.portraitDown,
          //       ],
          //     );
          //   });
          // }
          // );
        }
      });
    });
  }

  @override
  void dispose() {
    if (_isConnected) {
      _controller?.dispose();
      _chewieController?.dispose();
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('Connected to the Internet');
        return true;
      }
    } on SocketException catch (_) {
      print('Not connected to the Internet');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Provider.of<AppThemeProvider>(context).backgroundColor,
        title: Text('Learn Bitcoin',
            style: TextStyle(
                color: Provider.of<AppThemeProvider>(context).textColor)),
        centerTitle: true,
      ),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Consumer<AppThemeProvider>(
              builder: (context, appThemeProvider, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Slogan text
                  Center(
                    child: Text(
                      'Understand the basics and become part of the future',
                      style: TextStyle(
                        color: appThemeProvider.learnBitcoinSloganTextColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 26),
                  // Search bar
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: appThemeProvider.learnBitcoinSearchBarIconColor,
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                        color:
                            appThemeProvider.learnBitcoinSearchBarHintTextColor,
                      ),
                      filled: true,
                      fillColor: appThemeProvider.learnBitcoinSearchBarColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(140),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Chips
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildChip('Basics', selectedLabel == 'Basics'),
                      _buildChip('Blockchain', selectedLabel == 'Blockchain'),
                      _buildChip('Decentralization',
                          selectedLabel == 'Decentralization'),
                      _buildChip('lorem ipsum', selectedLabel == 'lorem ipsum'),
                      _buildChip('lorem', selectedLabel == 'lorem'),
                      _buildChip(
                          'lorem ipsum2', selectedLabel == 'lorem ipsum2'),
                    ],
                  ),
                  const SizedBox(height: 36),
                  // What is Bitcoin?
                  Text(
                    'What is Bitcoin?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: appThemeProvider.learnBitcoinTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Video Player
                  _buildVideoPlayer(),
                  const SizedBox(height: 16),
                  // Description
                  // Description text (expandable)
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: isDescriptionExpanded
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Text(
                      'Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id. Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id. Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id. Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id',
                      style: TextStyle(
                        color: appThemeProvider.learnBitcoinSloganTextColor,
                        fontSize: 16,
                      ),
                    ),
                    secondChild: Text(
                      'Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id',
                      style: TextStyle(
                        color: appThemeProvider.learnBitcoinSloganTextColor,
                        fontSize: 16,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Read more button
                  // Read more / Show less button
                  Center(
                    child: Container(
                      height: 35,
                      width: 140,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: appThemeProvider.isDarkMode
                            ? GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    appThemeProvider
                                        .learnBitcoinChipBorderColor2,
                                    appThemeProvider
                                        .learnBitcoinChipBorderColor3,
                                    appThemeProvider
                                        .learnBitcoinChipBorderColor1,
                                    appThemeProvider
                                        .learnBitcoinChipBorderColor4,
                                    appThemeProvider
                                        .learnBitcoinChipBorderColor3,
                                  ],
                                ),
                                width: 2,
                              )
                            : Border.all(
                                color: appThemeProvider
                                    .learnBitcoinButtonBorderColor,
                                width: 2,
                              ),
                        gradient: LinearGradient(
                          colors: [
                            appThemeProvider.learnBitcoinChipBackgroundColor1,
                            appThemeProvider.learnBitcoinChipBackgroundColor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isDescriptionExpanded = !isDescriptionExpanded;
                          });
                        },
                        style: TextButton.styleFrom(
                          visualDensity: VisualDensity.compact,
                          backgroundColor: appThemeProvider
                              .learnBitcoinButtonBackgroundColor,
                        ),
                        child: Text(
                          isDescriptionExpanded ? 'Show Less' : 'Read More',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white // Text color in dark mode
                              // Text color in light mode
                              ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),
                  // Quiz question
                  ..._buildQuizOptions(),
                  const SizedBox(height: 16),
                  // Quiz submit button
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: appThemeProvider
                              .learnBitcoinQuizSubmitButtonBorderColor, // Change this color to match your border color
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            4), // Adjust this to increase/decrease the gap
                        child: Container(
                          height: 35,
                          width: 218,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                appThemeProvider
                                    .learnBitcoinQuizSubmitButtonColor1,
                                appThemeProvider
                                    .learnBitcoinQuizSubmitButtonColor2,
                              ], // Change these colors to match your gradient
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              visualDensity: VisualDensity.compact,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 18,
                                color: appThemeProvider
                                    .learnBitcoinQuizSubmitButtonTextColor, // Text color
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 86),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  // Video player
  Widget _buildVideoPlayer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: _controller == null || !_controller!.value.isInitialized
              ? CustomPaint(
                  painter: AngularGradientBorderPainter(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              : CustomPaint(
                  painter: AngularGradientBorderPainter(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: AspectRatio(
                      aspectRatio: (_controller!.value.aspectRatio),
                      child: Chewie(
                        controller: _chewieController!,
                      ),
                    ),
                  ),
                ),
        ),
        if (_controller == null || !_controller!.value.isInitialized)
          const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
      ],
    );
  }

  // quiz options
  List<Widget> _buildQuizOptions() {
    List<String> options = [
      'A. A physical coin made of gold.',
      'B. A government-issued currency like the US dollar.',
      'C. A new kind of digital money that operates on a decentralized network.',
      'D. An online platform for buying and selling stocks.',
    ];

    return options.map((option) {
      return Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedOption = option;
                });
              },
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: selectedOption == option
                      ? appThemeProvider
                          .learnBitcoinQuizSelectedOptionBackgroundColor
                      : appThemeProvider.learnBitcoinQuizOptionBackgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: selectedOption == option
                        ? appThemeProvider
                            .learnBitcoinQuizSelectedOptionBorderColor
                        : appThemeProvider.learnBitcoinQuizOptionBorderColor,
                  ),
                ),
                child: Text(
                  option,
                  style: TextStyle(
                    color: selectedOption == option
                        ? appThemeProvider
                            .learnBitcoinQuizSelectedOptionTextColor
                        : appThemeProvider.learnBitcoinQuizOptionTextColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  // Chips
  Widget _buildChip(String label, bool isSelected) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return GestureDetector(
          onTap: () {
            setState(() {
              // Handle chip selection logic here
              selectedLabel = label;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [
                          appThemeProvider.learnBitcoinChipBorderColor2,
                          appThemeProvider.learnBitcoinChipBorderColor3,
                          appThemeProvider.learnBitcoinChipBorderColor1,
                          appThemeProvider.learnBitcoinChipBorderColor4,
                          appThemeProvider.learnBitcoinChipBorderColor3,
                        ],
                      ),
                      width: 2,
                    )
                  : Border.all(
                      color: Colors.transparent,
                      width: 2,
                    ),
              gradient: LinearGradient(
                colors: [
                  appThemeProvider.learnBitcoinChipBackgroundColor1,
                  appThemeProvider.learnBitcoinChipBackgroundColor2,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white
                  // Adjust text color based on selection
                  ),
            ),
          ),
        );
      },
    );
  }
}

class AngularGradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const SweepGradient(
        startAngle: 0.0,
        endAngle: 2 * 3.141592653589793, // Full circle
        colors: [
          Color(0xFFFFC876),
          Color(0xFF79FFF7),
          Color(0xFF9F53FF),
          Color(0xFFFF98E2),
          Color(0xFFFFC876),
        ],
        stops: [
          0.1,
          0.43,
          0.5,
          0.72,
          1.0, // Ensure the last stop matches the first color stop for smooth transition
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      const Radius.circular(16),
    );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
