import 'package:flutter/material.dart';
import 'package:movie_buzz/utils/responsive_util.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:skeletons/skeletons.dart';

class CutomListLoaderView extends StatelessWidget {
  const CutomListLoaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonGridLoader(
      builder: Card(
        color: Colors.transparent,
        child: GridTile(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50,
                height: 10,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Container(
                width: 70,
                height: 10,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      items: 8,
      itemsPerRow: MediaQuery.of(context).orientation.isLandScape ? 4 : 2,
      period: const Duration(seconds: 2),
      highlightColor: const Color(0xFFE3515B),
      direction: SkeletonDirection.ltr,
      childAspectRatio: 1,
    );
  }
}
