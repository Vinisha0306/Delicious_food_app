import 'package:delicious_food_app/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';

Widget all_product({required context, required size, required index}) {
  return GestureDetector(
    onTap: () {
      Navigator.of(context)
          .pushNamed(MyRoutes.detailPage, arguments: allFoods[index]);
    },
    child: Container(
      height: size.height * 0.25,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Hero(
              tag: allFoods[index]['name'],
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.4,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(
                      allFoods[index]['thumb'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  allFoods[index]['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  allFoods[index]['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                allFoods[index]['calories'] != ""
                    ? Text(
                        "Calories : ${allFoods[index]['calories'] ?? allFoods[0]['calories']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(""),
                allFoods[index]['carbos'] != ""
                    ? Text(
                        "Carbos : ${allFoods[index]['carbos'] ?? allFoods[0]['carbos']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(""),
                allFoods[index]['fats'] == ""
                    ? const Text("")
                    : Text(
                        "Fats : ${allFoods[index]['fats']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                allFoods[index]['proteins'] != ""
                    ? Text(
                        "Proteins : ${allFoods[index]['proteins'] ?? "23"}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(""),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
