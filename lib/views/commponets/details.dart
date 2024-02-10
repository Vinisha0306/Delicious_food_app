import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Details({required data, required size}) {
  return Column(
    children: [
      Container(
        height: size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
              data['image'],
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['name'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(
            data['headline'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          data['calories'] != ""
              ? Text(
                  "Calories : ${data['calories'] ?? data[0]['calories']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(""),
          data['carbos'] != ""
              ? Text(
                  "Carbos : ${data['carbos'] ?? data[0]['carbos']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(""),
          data['fats'] == ""
              ? const Text("")
              : Text(
                  "Fats : ${data['fats']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
          data['proteins'] != ""
              ? Text(
                  "Proteins : ${data['proteins'] ?? "23"}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const Text(""),
          Text(
            data['description'],
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      )
    ],
  );
}
