import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

class CutomListLoaderView extends StatelessWidget {
  const CutomListLoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 30,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 10,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      height: 12,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        items: 10,
        period: const Duration(seconds: 2),
        highlightColor: const Color.fromARGB(255, 85, 80, 161),
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
