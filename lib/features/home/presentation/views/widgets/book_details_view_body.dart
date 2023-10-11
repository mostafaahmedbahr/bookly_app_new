 import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'book_rate.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_list_view_item.dart';

class BookViewDetailsBody extends StatelessWidget {
  const BookViewDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width*0.2,
              vertical: MediaQuery.of(context).size.height*0.04
            ),
              child: const CustomBookImage(),
            ),
          const Text("Book 1",
          style: AppStyles.textStyle30,),
          const SizedBox(height: 10,),
            Text("Book 1 description",
            style: AppStyles.textStyle18.copyWith(
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
              color: Colors.grey,
            ),),
          const SizedBox(height: 18,),
          const BookingRating(),
          const SizedBox(height: 18,),
          ButtonAction(),
        ],
      ),
    );
  }
}




