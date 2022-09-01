import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showNoInternerMessage(BuildContext context) {
  showTopSnackBar(
    context,
    const CustomSnackBar.error(
      textStyle: TextStyle(fontSize: 20.0),
      message: 'Sorry no Internet!. Please check your connnection',
    ),
  );
}
