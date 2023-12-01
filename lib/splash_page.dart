import 'package:animate_do/animate_do.dart';
import 'package:dm_splash/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  bool fadeOut = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeInUp(
          child: FadeOutUp(
            animate: fadeOut,
            child: const Text(
              "Dream.Machine",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void init() async {
    //执行一些耗时操作，比如检查版本更新等等的。
    await Future.delayed(const Duration(seconds: 3)); //模拟耗时3秒
    setState(() {
      fadeOut = true; //启动消失动画
    });
    await Future.delayed(const Duration(milliseconds: 500)); //等动画跑完
    toHome();
  }

  /// 跳转到首页
  void toHome() {
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
    }
  }
}
