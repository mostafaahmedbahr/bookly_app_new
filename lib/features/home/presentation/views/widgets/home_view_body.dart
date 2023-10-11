 import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
  import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';

import 'custom_book_image_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              CustomAppBarWidget(),
              FeaturesBooksListView(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Best Seller",
                  style: AppStyles.textStyle18,
                ),
              ),
              SizedBox(height: 20,),

            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    );

  }
}



