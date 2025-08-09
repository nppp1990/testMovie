import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/common/widgets/image.dart';
import 'package:yj_moive/generated/locales.g.dart';
import 'package:yj_moive/modules/actor_detail/provider/detail.dart';
import 'package:yj_moive/modules/actor_detail/provider/movie_list.dart';
import 'package:yj_moive/modules/movie_detail/presentation/movie_detail_page.dart';
import 'package:yj_moive/network/model/business/movie/cast.dart';
import 'package:yj_moive/network/model/business/movie/movie.dart';
import 'package:yj_moive/service/image_extension.dart';

class ActorDetailPage extends StatelessWidget {
  final Person actor;

  const ActorDetailPage({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(actor.name)),
      body: _ActorDetailContentView(actor: actor),
    );
  }
}

class _ActorDetailContentView extends ConsumerWidget {
  final Person actor;

  const _ActorDetailContentView({required this.actor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personDetail = ref.watch(actorDetailProvider(actor.id));
    return personDetail.when(
      data: (actor) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileImage(imageUrl: actor.profilePath?.profileImage, width: 100, height: 150),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            actor.name,
                            style: const TextStyle(fontSize: 16, height: 1, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '${LocaleKeys.gender.tr}: ${actor.gender.name}',
                            style: const TextStyle(fontSize: 14, height: 1),
                          ),
                          if (actor.birthday != null)
                            Text(
                              '${LocaleKeys.birthday.tr}: ${actor.birthday!}',
                              style: const TextStyle(fontSize: 14, height: 1),
                            ),
                          if (actor.birthPlace != null)
                            Text(
                              '${LocaleKeys.birthplace.tr}: ${actor.birthPlace!}',
                              style: const TextStyle(fontSize: 14, height: 1),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: Colors.grey[300]),
              if (actor.biography?.isNotEmpty ?? false)
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.biography.tr,
                        style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Text(actor.biography!, style: const TextStyle(fontSize: 14, height: 1.5)),
                    ],
                  ),
                ),
              _MovieListLayout(personId: actor.id),
            ],
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error loading actor details')),
    );
  }
}

class _MovieListLayout extends ConsumerWidget {
  final int personId;

  const _MovieListLayout({required this.personId});

  @override
  Widget build(BuildContext context, ref) {
    final movies = ref.watch(actorMovieListProvider(personId)).asData?.value;
    if (movies == null || movies.isEmpty) {
      return SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            LocaleKeys.actingList.tr,
            style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 120 + 10 + 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            itemCount: movies.length,
            itemExtent: 90,
            itemBuilder: (context, index) {
              return _buildItem(movies[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildItem(Movie movie) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MovieDetailPage(movieId: movie.id));
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        spacing: 5,
        children: [
          MovieImage(imageUrl: movie.posterImageUrl, width: 80, height: 120),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 2),
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, height: 1),
            ),
          ),
        ],
      ),
    );
  }
}
