import 'package:flutter/material.dart';

import 'app_colors.dart';

showSnackBar({required String content, required BuildContext context}) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(content)));
}

void showProgressIndicator(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.blueColor),
      ),
    ),
  );
  showDialog(
      context: context,
      builder: (context) => alertDialog,
      barrierDismissible: false);
}