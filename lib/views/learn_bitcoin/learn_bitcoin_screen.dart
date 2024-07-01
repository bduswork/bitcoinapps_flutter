import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnBitcoinScreen extends StatefulWidget {
  const LearnBitcoinScreen({super.key});

  @override
  State<LearnBitcoinScreen> createState() => _LearnBitcoinScreenState();
}

class _LearnBitcoinScreenState extends State<LearnBitcoinScreen> {
  String selectedOption = '';

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
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      _buildChip('Basics'),
                      _buildChip('Blockchain'),
                      _buildChip('Decentralization'),
                      _buildChip('lorem ipsum'),
                      _buildChip('lorem ipsum'),
                      _buildChip('lorem ipsum'),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Text(
                    'What is Bitcoin?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: appThemeProvider.learnBitcoinTextColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.play_circle_fill,
                          size: 64, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Lorem ipsum dolor sit amet consectetur. Interdum libero facilisi vel congue gravida quisque aliquam. Est eu ut ipsum ultricies aliquet nulla. Accumsan nisi amet tortor tempor id......',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor:
                            appThemeProvider.learnBitcoinButtonBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                              color: AppThemeProvider()
                                  .learnBitcoinButtonBorderColor,
                            )),
                      ),
                      child: Text('Read More',
                          style: TextStyle(
                              fontSize: 22,
                              color: appThemeProvider
                                  .learnBitcoinButtonTextColor)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ..._buildOptions(),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        // primary: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Submit'),
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

  List<Widget> _buildOptions() {
    List<String> options = [
      'A. A physical coin made of gold.',
      'B. A government-issued currency like the US dollar.',
      'C. A new kind of digital money that operates on a decentralized network.',
      'D. An online platform for buying and selling stocks.',
    ];

    return options.map((option) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedOption = option;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  selectedOption == option ? Colors.deepPurple : Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: selectedOption == option ? Colors.white : Colors.white70,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  Widget _buildChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: [
            AppThemeProvider().learnBitcoinChipBackgroundColor1,
            AppThemeProvider().learnBitcoinChipBackgroundColor2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
    // return Chip(
    //   label: Text(label),
    //   backgroundColor: Colors.deepPurpleAccent,
    //   labelStyle: const TextStyle(color: Colors.white),
    // );
  }
}
