import 'package:btcapp/common/custom_dialog_box.dart';
import 'package:flutter/material.dart';

class DialogHelper {

  void showCustomDialogBox(BuildContext context, {String? title, required String content}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          title: title,
          content: content,
        );
      },
    );
  }

}