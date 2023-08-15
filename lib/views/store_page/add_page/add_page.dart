import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/viewModel/addProductInStoreViewModel.dart';
import 'package:kon_app/views/store_page/store_page.dart';
import 'package:kon_app/widgets/custom_button.dart';
import 'package:kon_app/widgets/custom_input.dart';
import 'package:provider/provider.dart';

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

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController birlikCtrl = TextEditingController();
  TextEditingController sizeCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController zapchast_idCtrl = TextEditingController();

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
              controller: sizeCtrl,
              miLenght: 1,
              text: "O`lchami",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: numberCtrl,
              miLenght: 1,
              text: "Shtrix raqami",
            ),
            const SizedBox(
              height: 14,
            ),
            CustomInput(
              controller: zapchast_idCtrl,
              miLenght: 1,
              text: "Zapchast ID",
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
                      zapchast_idCtrl.clear();
                      Get.offAll(const StorePage());
                    }),
                Consumer<AddStoreItem>(
                  builder: (context, value, child) => CustomButton(
                      text: "Saqlash",
                      onclick: () {
                        value.add(
                          nameCtrl.text,
                          birlikCtrl.text,
                          sizeCtrl.text,
                          int.parse(numberCtrl.text),
                          int.parse(zapchast_idCtrl.text),
                        );
                        nameCtrl.clear();
                        birlikCtrl.clear();
                        sizeCtrl.clear();
                        numberCtrl.clear();
                        zapchast_idCtrl.clear();
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
