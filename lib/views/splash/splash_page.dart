import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/views/home_page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => Get.offAll(const HomePage()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Center(
        child: Text(
          "WELCOME",
          style: TextStyle(color: Colors.white, fontSize: 33),
        ),
      ),
    );
  }
}
