import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/location/cubit/l10n_cubit.dart';

class LocalizationSettings extends StatefulWidget {
  const LocalizationSettings({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider.value(
        value: context.read<L10nCubit>(),
        child: const LocalizationSettings(),
      );
    });
  }

  @override
  State<LocalizationSettings> createState() => _LocalizationSettingsState();
}

class _LocalizationSettingsState extends State<LocalizationSettings> {
  String dropdownValue = 'English - UK';
  String icon = "uk.png";
  final menuItems = ['English - UK', 'Spanish - ES'];

  // @override
  // void didCh() {
  //   super.initState();
  //   dropdownValue = (context.locale.toStringWithSeparator() == 'en_UK')
  //       ? menuItems[0]
  //       : menuItems[1];
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    dropdownValue = (context.locale.toStringWithSeparator() == 'en_UK')
        ? menuItems[0]
        : menuItems[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('title').tr()),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 38, 12, 12),
        child: Container(
          height: 40,
          padding: const EdgeInsets.only(left: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.black, width: .9),
          ),
          child: Container(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  DropdownButton<String>(
                    icon: Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      height: 30,
                      width: 30,
                      child: Image(
                        image: AssetImage("assets/images/$icon"),
                      ),
                    ),
                    iconSize: 18,
                    elevation: 16,
                    value: dropdownValue,
                    style: const TextStyle(color: Colors.black),
                    underline: Container(
                      padding: const EdgeInsets.only(left: 4, right: 4),
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      // setState(() {
                      if (newValue == 'English - UK') {
                        // setState(() {
                        dropdownValue = 'English - UK';
                        icon = "uk.png";
                        context
                            .setLocale(const Locale('en', 'UK'))
                            .then((value) {
                          context.read<L10nCubit>().setLocale(0);
                        });
                        // });
                        // context.read<L10nCubit>().setLocale(0);
                      } else if (newValue == 'Spanish - ES') {
                        // setState(() {
                        dropdownValue = 'Spanish - ES';
                        icon = "es.png";
                        context
                            .setLocale(const Locale('es', 'SP'))
                            .then((value) {
                          context.read<L10nCubit>().setLocale(1);
                        });
                        // });
                        // context.read<L10nCubit>().setLocale(1);
                      }
                      // });
                    },
                    items:
                        menuItems.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 18,
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
