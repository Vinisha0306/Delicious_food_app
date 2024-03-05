import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Details({required data, required size}) {
  return Column(
    children: [
      Hero(
        flightShuttleBuilder: (context, _, __, context2, context3) =>
            const Center(
          child: CircularProgressIndicator(),
        ),
        tag: data['name'],
        child: Container(
          height: size.height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(
                data['image'],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.primaries[2].withOpacity(0.2),
            ),
            child: Text(
              data['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.primaries[3].withOpacity(0.2),
            ),
            child: Text(
              data['headline'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          data['calories'] != ""
              ? Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[4].withOpacity(0.2),
                  ),
                  child: Text(
                    "Calories : ${data['calories'] ?? data[0]['calories']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          data['carbos'] != ""
              ? Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[5].withOpacity(0.2),
                  ),
                  child: Text(
                    "Carbos : ${data['carbos'] ?? data[0]['carbos']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Container(),
          data['fats'] == ""
              ? Container()
              : Container(
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.primaries[6].withOpacity(0.2),
                  ),
                  child: Text(
                    "Fats : ${data['fats']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          if (data['proteins'] != "")
            Container(
              margin: const EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.primaries[7].withOpacity(0.2),
              ),
              child: Text(
                "Proteins : ${data['proteins'] ?? "23"}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          else
            Container(),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.primaries[12].withOpacity(0.2),
            ),
            child: Text(
              data['description'],
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      )
    ],
  );
}
