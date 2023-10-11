import 'package:flutter/material.dart';

import '../utils/styles.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft:   Radius.circular(20),
                    bottomLeft:Radius.circular(20)
                ),
                color: Colors.white,
              ),
              height: double.infinity,
              child:   Center(child: Text("Dd",
                style: AppStyles.textStyle18.copyWith(
                    color: Colors.black87
                ),)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight:   Radius.circular(20),
                    bottomRight:Radius.circular(20)
                ),
                color: Colors.grey,
              ),
              height: double.infinity,
              child: const Center(child: Text("Dd")),
            ),
          ),
        ],
      ),
    );
  }
}
