import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/viewModel/getAllProductViewModel.dart';
import 'package:kon_app/views/store_page/add_page/add_page.dart';
import 'package:kon_app/widgets/store_item.dart';
import 'package:provider/provider.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColor.mainColor,
          shape: const CircleBorder(),
          onPressed: () {
            Get.to(const AddStorePage());
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.mainColor,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.qr_code,
              ),
            ),
          ],
          backgroundColor: AppColor.bottomBarColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.transparent,
              hintText: "Qidirish ...",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Colors.black), // Change this line
              ),
              hintStyle: const TextStyle(color: Colors.white),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: AppColor.whiteColor),
              ),
            ),
          ),
        ),
        body: Consumer<GetAllProductViewModel>(
          builder: (context, value, child) {
            if (value.progress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.products.isEmpty) {
              return const Center(
                child: Text(
                  "Listda Hech narsa yoq",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (value.products.isNotEmpty) {
              return ListView.builder(
                itemCount: value.products.length,
                itemBuilder: (context, index) {
                  return StoreItem(
                    name: value.products[index].name,
                  );
                },
              );
            }
            return const SizedBox();
          },
        ));
  }
}
