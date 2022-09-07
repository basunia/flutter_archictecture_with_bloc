import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_api/model/movie_detail.dart';

class MovieDetailWidget extends StatelessWidget {
  const MovieDetailWidget({Key? key, this.movieDetail}) : super(key: key);
  final MovieDetail? movieDetail;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            movieDetail?.poster != null
                ? FittedBox(
                    fit: BoxFit.fill,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                        child:
                            CachedNetworkImage(imageUrl: movieDetail!.poster)))
                : Container(),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${movieDetail?.title}',
                    style: textTheme.headline5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Summary",
                      textScaleFactor: 1.5,
                      style: textTheme.caption,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Table(
                      textDirection: TextDirection.ltr,
                      defaultVerticalAlignment:
                          TableCellVerticalAlignment.middle,
                      border: TableBorder.all(width: 1.0, color: Colors.black),
                      children: [
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "IMDB rating",
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetail?.imdbRating ?? '',
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Genre",
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetail?.genre ?? '',
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Director",
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetail?.director ?? '',
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Released",
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieDetail?.released ?? '',
                              textScaleFactor: 1.0,
                              style: textTheme.subtitle1,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    'Plot',
                    style: textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  // const Spacer(),
                  Text(
                    '${movieDetail?.plot}',
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
