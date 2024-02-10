import 'package:delicious_food_app/utils/routes_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';

Widget diet_page_details({required context, required size, required index}) {
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
                    diet[index]['thumb'],
                  ),
                  fit: BoxFit.cover,
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
                  diet[index]['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  diet[index]['description'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                diet[index]['calories'] != ""
                    ? Text(
                        "Calories : ${diet[index]['calories'] ?? diet[0]['calories']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(""),
                diet[index]['carbos'] != ""
                    ? Text(
                        "Carbos : ${diet[index]['carbos'] ?? diet[0]['carbos']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : const Text(""),
                diet[index]['fats'] == ""
                    ? const Text("")
                    : Text(
                        "Fats : ${diet[index]['fats']}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                diet[index]['proteins'] != ""
                    ? Text(
                        "Proteins : ${diet[index]['proteins'] ?? "23"}",
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
