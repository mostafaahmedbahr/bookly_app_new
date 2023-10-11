import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: (){
        //    GoRouter.of(context).p(AppRouter.kHomeView);
          },
          icon: const Icon(Icons.close),
        ),
        IconButton(
          onPressed: (){},
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}