import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';

Widget poster({required context, required size, required index}) {
  return Container(
    height: size.height * 0.25,
    width: size.width * 0.8,
    margin: EdgeInsets.all(7),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(
          image[index],
        ),
        fit: BoxFit.cover,
      ),
    ),
  );
}
