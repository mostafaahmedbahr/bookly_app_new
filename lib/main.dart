import 'package:bookly_app/core/utils/app_routers.dart';
 import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constants.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('books');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: primaryColor,
        // textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        textTheme:  ThemeData.dark().textTheme,
      ),

    );
  }
}

