import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_buzz/location/location_page.dart';

import '../../localization/localization_settings.dart';

class NavigationDrawer extends Drawer {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: const Text('title').tr(),
          ),
          ListTile(
            title: const Text('My location'),
            onTap: () {
              Navigator.push(context, LocationPage.route());
            },
          ),
          ListTile(
            title: const Text('Language'),
            onTap: () {
              Navigator.push(context, LocalizationSettings.route());
            },
          ),
        ],
      ),
    );
    // return Builder(builder: (context) {
    //   final width = MediaQuery.of(context).size.width;
    //   final height = MediaQuery.of(context).size.height;

    //   return Container(
    //       height: height,
    //       width: width * 0.8,
    //       decoration: const BoxDecoration(color: Colors.white),
    //       child: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: ListView(
    //           children: [],
    //         ),
    //         // child: Column(
    //         //   mainAxisAlignment: MainAxisAlignment.center,
    //         //   crossAxisAlignment: CrossAxisAlignment.start,
    //         //   children: [
    //         //     InkWell(
    //         //         onTap: () {
    //         //           Navigator.push(context, LocationPage.route());
    //         //         },
    //         //         child: const Text('My location')),
    //         //     const SizedBox(
    //         //       height: 8.0,
    //         //     ),
    //         //     const Text('Change language'),
    //         //   ],
    //         // ),
    //       ));
    // });
  }
}
