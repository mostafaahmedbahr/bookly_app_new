import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingRating extends StatelessWidget {
  const BookingRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        FaIcon( FontAwesomeIcons.solidStar,color: Colors.yellow,),
        SizedBox(width: 7,),
        Text("4.8",style: AppStyles.textStyle16,),
        SizedBox(width: 5,),
        Text("(1580)",style: AppStyles.textStyle14,),
      ],
    );
  }
}