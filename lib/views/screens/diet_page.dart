import 'dart:developer';
import 'package:delicious_food_app/views/commponets/diet_detail.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';

class DietPage extends StatefulWidget {
  const DietPage({super.key});

  @override
  State<DietPage> createState() => _DietPageState();
}

class _DietPageState extends State<DietPage> {
  int calouris = 0;
  int carbos = 0;
  int fats = 0;
  int proteins = 0;
  @override
  void initState() {
    super.initState();
    diet.map((e) {
      int cal = int.parse(e['calories'].toString().split(' ')[0]);
      int car = int.parse(e['carbos'].toString().split(' ')[0]);
      int fat = int.parse(e['fats'].toString().split(' ')[0]);
      int pro = int.parse(e['proteins'].toString().split(' ')[0]);
      calouris += cal;
      carbos += car;
      fats += fat;
      proteins += pro;
    }).toList();
  }

  int p = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Diet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    diet.length,
                    (index) => diet_page_details(
                        context: context, size: size, index: index, p: p),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: size.height * 0.14,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(-3, -3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "\tTotal :-",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "\tCalories : $calouris",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\tCarbos : $carbos",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\tFats : $fats",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "\tProteins : $proteins",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
