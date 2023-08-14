
// ignore_for_file: depend_on_referenced_packages

// import 'package:get_it/get_it.dart';

// import 'prefs.dart';


// final getIt = GetIt.instance;

// Future<void> registerSingelton() async {
//   final prefUtils  = PrefUtils();
//   await prefUtils.initInstane();

//   getIt.registerSingleton(prefUtils);
// }

// Future<void> provideApiService()async{
//   try{
//     await getIt.unregister<ApiService>();
//   }
//   catch(e){
//
//   }
//   final api = ApiService();
//   await api.addHeadrs();
//   getIt.registerSingleton(api);
// }