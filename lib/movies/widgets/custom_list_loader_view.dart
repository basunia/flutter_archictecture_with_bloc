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

// return ListView.builder(
//   physics: NeverScrollableScrollPhysics(),
//   itemCount: 5,
//   itemBuilder: (context, index) => Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(color: Colors.white),
//       child: SkeletonItem(
//           child: Column(
//         children: [
//           Row(
//             children: [
//               SkeletonAvatar(
//                 style: SkeletonAvatarStyle(
//                     shape: BoxShape.circle, width: 50, height: 50),
//               ),
//               SizedBox(width: 8),
//               Expanded(
//                 child: SkeletonParagraph(
//                   style: SkeletonParagraphStyle(
//                       lines: 3,
//                       spacing: 6,
//                       lineStyle: SkeletonLineStyle(
//                         randomLength: true,
//                         height: 10,
//                         borderRadius: BorderRadius.circular(8),
//                         minLength: MediaQuery.of(context).size.width / 6,
//                         maxLength: MediaQuery.of(context).size.width / 3,
//                       )),
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: 12),
//           SkeletonParagraph(
//             style: SkeletonParagraphStyle(
//                 lines: 3,
//                 spacing: 6,
//                 lineStyle: SkeletonLineStyle(
//                   randomLength: true,
//                   height: 10,
//                   borderRadius: BorderRadius.circular(8),
//                   minLength: MediaQuery.of(context).size.width / 2,
//                 )),
//           ),
//           SizedBox(height: 12),
//           SkeletonAvatar(
//             style: SkeletonAvatarStyle(
//               width: double.infinity,
//               minHeight: MediaQuery.of(context).size.height / 8,
//               maxHeight: MediaQuery.of(context).size.height / 3,
//             ),
//           ),
//           SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   SkeletonAvatar(
//                       style: SkeletonAvatarStyle(width: 20, height: 20)),
//                   SizedBox(width: 8),
//                   SkeletonAvatar(
//                       style: SkeletonAvatarStyle(width: 20, height: 20)),
//                   SizedBox(width: 8),
//                   SkeletonAvatar(
//                       style: SkeletonAvatarStyle(width: 20, height: 20)),
//                 ],
//               ),
//               SkeletonLine(
//                 style: SkeletonLineStyle(
//                     height: 16,
//                     width: 64,
//                     borderRadius: BorderRadius.circular(8)),
//               )
//             ],
//           )
//         ],
//       )),
//     ),
//   ),
// );

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: Container(
            // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
          elevation: 2.0,
          margin: const EdgeInsets.all(8.0),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    // height: 300,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        topRight: Radius.circular(8.0),
                      ),
                      child: Container(),
                    ),
                  ),
                ),
              ),
              // if (i % 10 == 0)
              //   const Text('------------------'),

              SkeletonLine(
                style: SkeletonLineStyle(
                    height: 16,
                    width: 64,
                    borderRadius: BorderRadius.circular(8)),
              )

              // ListTile(
              //   // leading: Text(
              //   //   '${index + 1}',
              //   //   // style: textTheme.caption,
              //   // ),
              //   title: Text(
              //     '',
              //     // style:
              //     //     textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400),
              //     // overflow: TextOverflow.ellipsis,
              //   ),
              //   // trailing: Text(movie.year, style: textTheme.caption),
              //   dense: true,
              // ),
            ],
          ),
        )
            // child: Row(
            //   children: <Widget>[
            //     const CircleAvatar(
            //       backgroundColor: Colors.white,
            //       radius: 30,
            //     ),
            //     const SizedBox(width: 10),
            //     Expanded(
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             width: double.infinity,
            //             height: 10,
            //             color: Colors.white,
            //           ),
            //           const SizedBox(height: 10),
            //           Container(
            //             width: double.infinity,
            //             height: 12,
            //             color: Colors.white,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            ),
        items: 10,
        period: const Duration(seconds: 2),
        highlightColor: const Color.fromARGB(255, 85, 80, 161),
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
