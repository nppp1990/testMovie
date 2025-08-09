import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:yj_moive/gen/assets.gen.dart';
import 'package:yj_moive/modules/movie_list/presentation/movie_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.repeat(reverse: true);
    _initData();
  }

  void _initData() async {
    // 模拟初始化
    await 2.delay();
    // 跳转到电影列表页面
    if (!context.mounted) {
      return;
    }
    Get.off(() => const MoviePage());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: 1.0 + _controller.value * 0.5,
              child: child,
            );
          },
          child: Image.asset(
            Assets.images.icLauncher,
            // todo 这里大小感觉应该要根据分辨率计算了，懒得写了
            width: 48,
          ),
        ),
      ),
    );
  }
}
