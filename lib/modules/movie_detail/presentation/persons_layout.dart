import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yj_moive/common/widgets/image.dart';
import 'package:yj_moive/modules/movie_detail/provider/person_list.dart';
import 'package:yj_moive/network/model/business/movie/cast.dart';
import 'package:yj_moive/service/image_extension.dart';

class PersonsLayout extends ConsumerWidget {
  final int movieId;

  const PersonsLayout({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final personInfo = ref.watch(personResultProvider(movieId)).asData?.value;
    if (personInfo == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        _buildLabel('演员阵容'),
        _buildPersonList(personInfo.casterList),
        _buildLabel('演职人员'),
        _buildPersonList(personInfo.crewList),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildPersonList(List<Person> persons) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 20),
        itemCount: persons.length,
        itemExtent: 100,
        itemBuilder: (context, index) {
          final person = persons[index];
          return _PersonItemView(person: person);
        },
      ),
    );
  }
}

class _PersonItemView extends StatelessWidget {
  final Person person;

  const _PersonItemView({required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 170,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 3,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(6), topRight: Radius.circular(6)),
            child: ProfileImage(imageUrl: person.profilePath?.profileImage, width: 90, height: 120),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              person.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, height: 1, color: Colors.black, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(person.type.displayName, style: const TextStyle(fontSize: 10, height: 1, color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
