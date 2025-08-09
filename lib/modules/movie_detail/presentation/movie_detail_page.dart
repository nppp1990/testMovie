import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/common/widgets/image.dart';
import 'package:yj_moive/generated/locales.g.dart';
import 'package:yj_moive/modules/movie_detail/presentation/persons_layout.dart';
import 'package:yj_moive/modules/movie_detail/provider/movie_detail.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';

class MovieDetailPage extends ConsumerWidget {
  // final int movieId;
  static const String argMovieId = 'movieId';

  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieId = Get.arguments[argMovieId] as int;

    final movieState = ref.watch(movieDetailProvider(movieId));

    return movieState.when(
      data: (movie) {
        if (movie == null) {
          return Scaffold(body: Center(child: Text('Error loading movie details')));
        }
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          child: Scaffold(
            backgroundColor: Color(0xff323232).withOpacity(0.6),
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MovieHeader(movie: movie),
                    _buildLabel(LocaleKeys.biography.tr),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        movie.overview,
                        style: const TextStyle(fontSize: 14, color: Colors.white, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(height: 20),
                    PersonsLayout(movieId: movieId),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      loading: () => Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (error, stack) => Scaffold(body: Center(child: Text('Error loading movie details'))),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _MovieHeader extends StatelessWidget {
  final Movie movie;

  const _MovieHeader({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (movie.backdropImageUrl != null)
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: movie.backdropImageUrl!,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox.shrink(),
              errorWidget: (context, url, error) => SizedBox.shrink(),
            ),
          ),
        SizedBox(
          width: double.infinity,
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: MovieImage(imageUrl: movie.posterImageUrl, width: 100, height: 150),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 5),
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 20,
                            height: 1,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        _buildTypeView(),
                        _buildTimeView(),
                        SizedBox(height: 10),
                        Text(
                          'Rating: ${(movie.voteAverage * 10).toStringAsFixed(0)}%',
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTypeView() {
    final types = movie.types;
    if (types == null || types.isEmpty) {
      return const SizedBox.shrink();
    }
    final typeNames = types.map((e) => e.name).join(', ');
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 10),
      child: Text(typeNames, style: TextStyle(fontSize: 14, height: 1, color: Colors.white)),
    );
  }

  Widget _buildTimeView() {
    // 2022-07-24(cn) 120分钟
    final timeStr =
        '${movie.releaseDate}(${movie.language.toUpperCase()}) ${movie.runtime == null ? '' : '${movie.runtime}分钟'}';
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 10),
      child: Text(timeStr, style: TextStyle(fontSize: 14, height: 1, color: Colors.white)),
    );
  }
}
