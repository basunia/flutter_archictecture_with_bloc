import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showNoInternerMessage(BuildContext context) {
  showTopSnackBar(
    context,
    CustomSnackBar.error(
      textStyle: const TextStyle(fontSize: 20.0),
      message: 'no_internet_msg'.tr(),
    ),
  );
}
