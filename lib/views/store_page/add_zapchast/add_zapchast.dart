import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/viewModel/getAllZapchast.dart';
import 'package:kon_app/views/store_page/store_page.dart';
import 'package:kon_app/widgets/custom_button.dart';
import 'package:kon_app/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class AddStoreZapchastPage extends StatefulWidget {
  const AddStoreZapchastPage({super.key});

  @override
  State<AddStoreZapchastPage> createState() => _AddStoreZapchastPageState();
}

class _AddStoreZapchastPageState extends State<AddStoreZapchastPage> {
  // "name": "string",
  // "birlik": "string",
  // "type_id": 0,
  // "size": "string",
  // "number": 0

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController birlikCtrl = TextEditingController();
  TextEditingController type_idCtrl = TextEditingController();
  TextEditingController sizeCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        title: const Text("Zapchast qoshish"),
        backgroundColor: AppColor.bottomBarColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomInput(
              controller: nameCtrl,
              miLenght: 1,
              text: "Nomi",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: birlikCtrl,
              miLenght: 1,
              text: "Birlik",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: type_idCtrl,
              miLenght: 1,
              text: "Tur raqami",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: sizeCtrl,
              miLenght: 1,
              text: "O'lchami",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: numberCtrl,
              miLenght: 1,
              text: "Raqami",
            ),
            const SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    text: "Bekor qilish",
                    onclick: () {
                      nameCtrl.clear();
                      birlikCtrl.clear();
                      sizeCtrl.clear();
                      numberCtrl.clear();
                      type_idCtrl.clear();
                      Get.offAll(const StorePage());
                    }),
                Consumer<GetAllZapchastViewModel>(
                  builder: (context, value, child) => CustomButton(
                      text: "Saqlash",
                      onclick: () {
                        value.addZapchast(
                          nameCtrl.text.trim(),
                          birlikCtrl.text,
                          int.parse(type_idCtrl.text),
                          sizeCtrl.text,
                          int.parse(numberCtrl.text),
                        );
                        nameCtrl.clear();
                        birlikCtrl.clear();
                        sizeCtrl.clear();
                        numberCtrl.clear();
                        type_idCtrl.clear();
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
