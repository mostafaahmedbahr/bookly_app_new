import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.white
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.search,color: Colors.white,),
        )
      ),
    );
  }
}
