import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/app_routers.dart';
import 'package:bookly_app/core/utils/assets_path.dart';
import 'package:bookly_app/core/utils/styles.dart';
 import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
 class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: SizedBox(
        height: 130,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.7/4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.red,
                  image: const DecorationImage(
                    image: AssetImage(AssetsPath.testImage),
                    fit:BoxFit.fill ,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Harry botter and harry botter",
                 style: AppStyles.textStyle20.copyWith(
                   fontFamily: kGtSectraFine,
                 ),
               maxLines: 2,
               overflow: TextOverflow.ellipsis,),
               const SizedBox(height: 5,),
               Text("Mostafa Bahr",
               style: AppStyles.textStyle14,),
               const SizedBox(height: 5,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("19.54 \$",
                     style: AppStyles.textStyle20.copyWith(
                       fontWeight: FontWeight.bold,
                     ),),
                   const BookingRating(),

                 ],
               ),
             ],
           ),),

          ],
        ),
      ),
    );
  }
}



