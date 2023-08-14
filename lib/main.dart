import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:kon_app/viewModel/getAllProductViewModel.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'viewModel/authViewModel.dart';
import 'views/splash/splash_page.dart';

// DioRequestInspector dioRequestInspector =
//     DioRequestInspector(isDebugMode: kDebugMode);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDoc = await getApplicationDocumentsDirectory();

  Hive.init(appDoc.path);
  await Hive.openBox("auth");

  // registerSingelton();
  // await PrefUtils().initInstane();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetAllProductViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const SplashPage(),
    );
  }
}
