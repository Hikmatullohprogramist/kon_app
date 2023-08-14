import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/views/store_page/store_page.dart';
import 'package:kon_app/widgets/custom_container.dart';
import 'package:kon_app/widgets/menu_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bottomBarColor,
        title: const Text(
          "Konbain Service",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: AppColor.mainColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const MenuItem("Savdo", "assets/icons/savdo.png"),
              const SizedBox(
                height: 8,
              ),
              InkWell(
                  onTap: () => Get.to(const StorePage()),
                  child: const MenuItem("Ombor", "assets/icons/ombor.png")),
              const SizedBox(
                height: 8,
              ),
              const MenuItem("Kassa", "assets/icons/kassa.png"),
              const SizedBox(
                height: 8,
              ),
              const MenuItem("Haridorlar", "assets/icons/haridorlar.png"),
              const SizedBox(
                height: 8,
              ),
              const MenuItem(
                  "Qaytarilganlar", "assets/icons/qaytarilganlar.png"),
              const SizedBox(
                height: 8,
              ),
              const MenuItem("Firmalar", "assets/icons/firmalar.png"),
              const SizedBox(
                height: 8,
              ),
              const MenuItem("Statistikalar", "assets/icons/statistika.png"),
              const SizedBox(
                height: 8,
              ),
              const MenuItem("Sozlamalar", "assets/icons/sozlamalar.png"),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomContainer(
                    width: 72,
                    height: 50,
                    child: Image.asset("assets/icons/exit.png"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
