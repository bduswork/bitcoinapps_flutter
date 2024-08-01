
import 'package:btcapp/common/custom_gradient_border.dart';
import 'package:btcapp/enum/border_side_type.dart';
import 'package:btcapp/providers/block_provider/block_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddBlockScreen extends StatefulWidget {
  const AddBlockScreen({super.key});

  @override
  State<AddBlockScreen> createState() => _AddBlockScreenState();
}

class _AddBlockScreenState extends State<AddBlockScreen> {
  String _text = 'Hello, World!';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BlockProvider>().fetchPublicGeneralBlocks();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<AppThemeProvider, BlockProvider>(
      builder: (context, appThemeProvider, blockProvider, _) {
        return CustomGradientBorder(
          gradient: LinearGradient(
          colors: [
            appThemeProvider.customButtonBorderGradientColor1,
            appThemeProvider.customButtonBorderGradientColor2,
          ],
        ),
        borderWidth: 1.5,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        borderSideTypes: const {
          BorderSideType.left,
          BorderSideType.top,
          BorderSideType.right
        },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              color: appThemeProvider.backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Custom Bottom Sheet',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(_text),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Enter some text',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Do something with the text
                    print(_text);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}