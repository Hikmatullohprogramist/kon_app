import 'package:flutter/material.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/widgets/custom_container.dart';
import 'package:kon_app/widgets/custom_input.dart';

class AddStorePage extends StatefulWidget {
  const AddStorePage({super.key});

  @override
  State<AddStorePage> createState() => _AddStorePageState();
}

class _AddStorePageState extends State<AddStorePage> {
  // "name": "string",
  // "birlik": "string",
  // "size": "string",
  // "number": 0,
  // "zapchast_id": 0
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        title: const Text("Tovar qoshish"),
        backgroundColor: AppColor.bottomBarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomInput(
              text: "Nomi",
            ),

            CustomInput(
              text: "Birlik",
            ),
            CustomInput(
              text: "O`lchami",
            ),
            CustomInput(
              text: "Shtrix raqami",
            ),
            CustomInput(
              text: "Zapchast ID",
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainer(
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Bekor qilish",
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                  ),
                ),
                CustomContainer(
                  width: 200,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Saqlash",
                      style: TextStyle(color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
