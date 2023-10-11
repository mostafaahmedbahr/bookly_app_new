import 'package:bookly_app/core/utils/app_routers.dart';
 import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
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

