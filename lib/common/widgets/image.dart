import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yj_moive/gen/assets.gen.dart';

class MovieImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const MovieImage({super.key, this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return _buildErrorWidget();
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => _buildErrorWidget(),
    );
  }

  Widget _buildErrorWidget() {
    return Center(child: Image.asset(Assets.images.icPicError, width: width / 2));
  }
}

class ProfileImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;

  const ProfileImage({super.key, this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return _buildErrorView();
    }
    return CachedNetworkImage(
      imageUrl: imageUrl!,
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => _buildErrorView(),
    );
  }

  Widget _buildErrorView() {
    return Container(
      color: Color(0xffB0B0B0),
      width: width,
      height: height,
      alignment: Alignment.center,
      child: ProfileEmptyImage(width: width / 2),
    );
  }
}

class ProfileEmptyImage extends StatelessWidget {
  final double width;

  const ProfileEmptyImage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.images.icProfile,
      width: width,
      fit: BoxFit.contain,
      colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
    );
  }
}
