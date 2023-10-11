import 'package:flutter/material.dart';

import 'custom_search_fext_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          CustomSearchTextField(),
        ],
      ),
    );
  }
}