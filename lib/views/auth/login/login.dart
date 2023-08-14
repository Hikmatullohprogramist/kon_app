import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/viewModel/authViewModel.dart';
import 'package:kon_app/widgets/custom_button.dart';
import 'package:kon_app/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColor.mainColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColor.bottomBarColor,
            centerTitle: true,
            title: const Text(
              "Kombain service app",
              // getIt.get<PrefUtils>().getLanguage() == "uz" ? "EN" : "UZ",
              style: TextStyle(
                color: AppColor.whiteColor,
                fontSize: 16,
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "LOGO",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 44),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Kirish".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomInput(
                              hint: "Kiriting...",
                              text: "Login".tr,
                              miLenght: 0,
                              inputType: TextInputType.text,
                              controller: phoneController,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            CustomInput(
                              hint: "Kiriting...",
                              text: "Password",
                              miLenght: 0,
                              controller: passwordController,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<AuthModel>(
                  builder: (context, value, child) {
                    return CustomButton(
                      progress: value.progress,
                      text: "Kirish",
                      color: AppColor.bottomBarColor,
                      onclick: () {
                        if (phoneController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          value.login(
                            phoneController.text,
                            passwordController.text,
                          );
                        } else {
                          Get.snackbar("Xatolik", "Iltimos joylarni toldiring");
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
