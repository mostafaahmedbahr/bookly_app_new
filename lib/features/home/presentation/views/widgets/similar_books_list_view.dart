import 'package:flutter/cupertino.dart';

import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return const CustomBookImage();
        },
      ),
    );
  }
}