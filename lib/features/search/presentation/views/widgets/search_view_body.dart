import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

import 'custom_search_fext_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:   EdgeInsets.all(30.0),
      child: Column(
        children: [
          CustomSearchTextField(),
          SizedBox(height: 20,),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}