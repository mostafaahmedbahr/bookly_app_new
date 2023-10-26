import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentation/manager/fetch_all_books_cubit/fetch_all_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FeaturesBooksListView extends StatelessWidget {
  const FeaturesBooksListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books ;
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<FetchAllBooksCubit, FetchAllBooksStates>(
  builder: (context, state) {
    var fetchAllBooksCubit = FetchAllBooksCubit.get(context);
    if(state is FetchAllBooksSuccessState){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: MediaQuery.of(context).size.height*0.3,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context,index){
              return   CustomBookImage(
                imageUrl: books[index].image ?? "",
              );
            },
          ),
        ),
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
);
  }
}
