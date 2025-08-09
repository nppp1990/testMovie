import 'package:flutter/material.dart';
import 'package:yj_moive/modules/movie_detail/presentation/movie_detail_page.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';

class MovieListItemView extends StatelessWidget {
  final Movie movie;

  const MovieListItemView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MovieDetailPage(movieId: movie.id))
          );
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
                  Image.network(movie.imageUrl, width: 100, height: 150, fit: BoxFit.cover),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(movie.title, style: const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w700)),
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
                          'Rating: ${_getRate(movie.voteAverage)}',
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

  String _getRate(double voteAverage) {
    // 0.45 ->45%  0.3456 -> 34%
    return '${(voteAverage * 10).toStringAsFixed(0)}%';
  }
}
