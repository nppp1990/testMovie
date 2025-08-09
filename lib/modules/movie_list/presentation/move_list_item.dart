import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yj_moive/common/widgets/image.dart';
import 'package:yj_moive/generated/locales.g.dart';
import 'package:yj_moive/modules/movie_detail/presentation/movie_detail_page.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/routes/index.dart';

class MovieListItemView extends StatelessWidget {
  final Movie movie;
  final String? query;

  const MovieListItemView({super.key, required this.movie, this.query});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.movieDetail, arguments: {MovieDetailPage.argMovieId: movie.id});
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieImage(imageUrl: movie.posterImageUrl, width: 100, height: 150),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        _buildTitleView(),
                        const SizedBox(height: 10),
                        Text(movie.releaseDate, style: const TextStyle(fontSize: 14, height: 1, color: Colors.grey)),
                        const SizedBox(height: 10),
                        Text(
                          movie.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, height: 1),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          // 'Rating: ${_getRate(movie.voteAverage)}',
                          LocaleKeys.ratingFormat.trParams({'rating': _getRate(movie.voteAverage)}),
                          style: const TextStyle(
                            fontSize: 14,
                            height: 1,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey[400],
              // indent: 15 + 100 + 10, // 15 padding + 100 image width + 10 spacing
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleView() {
    if (query == null || query!.isEmpty || !movie.title.contains(query!)) {
      return Text(
        movie.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w700),
      );
    }
    final queryIndex = movie.title.indexOf(query!);
    final beforeQuery = movie.title.substring(0, queryIndex);
    final afterQuery = movie.title.substring(queryIndex + query!.length);
    final normalStyle = const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w700, color: Colors.black);
    final queryStyle = normalStyle.copyWith(backgroundColor: Colors.grey);
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: normalStyle,
        children: [
          TextSpan(text: beforeQuery),
          TextSpan(text: query, style: queryStyle),
          TextSpan(text: afterQuery),
        ],
      ),
    );
  }

  String _getRate(double voteAverage) {
    // 0.45 ->45%  0.3456 -> 34%
    return '${(voteAverage * 10).toStringAsFixed(0)}%';
  }
}
