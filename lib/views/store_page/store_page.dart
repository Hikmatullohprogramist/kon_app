import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kon_app/utils/colors.dart';
import 'package:kon_app/viewModel/getAllProductViewModel.dart';
import 'package:kon_app/viewModel/getAllZapchast.dart';
import 'package:kon_app/views/store_page/add_page/add_page.dart';
import 'package:kon_app/views/store_page/add_zapchast/add_zapchast.dart';
import 'package:kon_app/widgets/store_item.dart';
import 'package:provider/provider.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late GetAllProductViewModel viewModel;
  late GetAllZapchastViewModel viewZapchast;

  @override
  void initState() {
    viewModel = context.read<GetAllProductViewModel>();
    viewZapchast = context.read<GetAllZapchastViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.getAllProduct();
      viewZapchast.getAllZapchast();
    });
    super.initState();
  }

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<GetAllProductViewModel>(context, listen: false)
        .getAllProduct();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        closedForegroundColor: AppColor.bottomBarColor,
        openForegroundColor: AppColor.whiteColor,
        closedBackgroundColor: AppColor.whiteColor,
        openBackgroundColor: AppColor.bottomBarColor,
        labelsBackgroundColor: AppColor.whiteColor,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: const Icon(Icons.store),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Omborga tovar qo`shish',
            onPressed: () {
              Get.to(const AddStorePage());
            },
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: const Icon(Icons.settings_suggest_rounded),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'Hom ashyo qoshish',
            onPressed: () {
              Get.to(const AddStoreZapchastPage());
            },
          ),
          //  Your other SpeedDialChildren go here.
        ],
        child: const Icon(Icons.add),
      ),
      backgroundColor: AppColor.mainColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
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
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 160.0,
            height: 40.0,
            decoration: BoxDecoration(
              color: AppColor.mainColor,
              border: Border.all(color: AppColor.whiteColor),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex--;
                      if (kDebugMode) {
                        print(currentIndex);
                      }
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                      color: currentIndex == 0
                          ? AppColor.bottomBarColor
                          : AppColor.mainColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.store,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex++;
                      if (kDebugMode) {
                        print(currentIndex);
                      }
                    });
                  },
                  child: Container(
                    width: 78,
                    height: 40,
                    decoration: BoxDecoration(
                      color: currentIndex == 1
                          ? AppColor.bottomBarColor
                          : AppColor.mainColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: const Icon(
                      Icons.settings_suggest_rounded,
                      color: AppColor.whiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (currentIndex == 0)
            Expanded(
              child: Consumer<GetAllProductViewModel>(
                builder: (context, value, child) => RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: Consumer<GetAllProductViewModel>(
                    builder: (context, value, child) {
                      if (value.progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (value.products.isEmpty) {
                        return const Center(
                          child: Text(
                            "Listda hech narsa yoq",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (value.products.isNotEmpty) {
                        return ListView.builder(
                          itemCount: value.products.length,
                          itemBuilder: (context, index) {
                            return StoreItem(
                              name: value.products[index].name,
                              birlik: value.products[index].birlik,
                              size: value.products[index].size,
                              number: value.products[index].number,
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Consumer<GetAllZapchastViewModel>(
                builder: (context, value, child) => RefreshIndicator(
                  onRefresh: () => _refreshProducts(context),
                  child: Consumer<GetAllZapchastViewModel>(
                    builder: (context, value, child) {
                      if (value.progress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (value.productZapchast.isEmpty) {
                        return const Center(
                          child: Text(
                            "Listda hech narsa yoq",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      } else if (value.productZapchast.isNotEmpty) {
                        return ListView.builder(
                          itemCount: value.productZapchast.length,
                          itemBuilder: (context, index) {
                            return StoreItem(
                              name: value.productZapchast[index].name,
                              birlik: value.productZapchast[index].birlik
                                  .toString(),
                              size: value.productZapchast[index].typeId
                                  .toString(),
                              number:
                                  value.productZapchast[index].size.toString(),
                            );
                          },
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
