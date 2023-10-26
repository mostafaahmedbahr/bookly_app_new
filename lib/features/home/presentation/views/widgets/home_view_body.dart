import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_all_books_cubit/fetch_all_books_cubit.dart';
import 'custom_book_image_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBarWidget(),
              BlocBuilder<FetchAllBooksCubit, FetchAllBooksStates>(
                builder: (context, state) {
                  if(state is FetchAllBooksSuccessState){
                    return FeaturesBooksListView(
                      books: state.books,
                    );
                  }
                  else if(state is FetchAllBooksErrorState){
                    return const Center(child:  Text("Error"));
                  }
                  else{
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Best Seller",
                  style: AppStyles.textStyle18,
                ),
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: BestSellerListView(),
        ),
      ],
    );
  }
}



