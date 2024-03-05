import 'package:delicious_food_app/views/commponets/details.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';
import 'package:delicious_food_app/utils/routes_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['name'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyRoutes.dietPage);
            },
            child: SizedBox(
              height: size.height * 0.07,
              width: size.width * 0.07,
              child: const Image(
                image: AssetImage("assets/images/diet.png"),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Details(data: data, size: size),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;

          if (diet.contains(data)) {
            diet.remove(data);
            snackBar = SnackBar(
                content: Text("${data['name']} remove from the CART !!"),
                backgroundColor: Colors.red.withOpacity(0.7),
                behavior: SnackBarBehavior.floating);
          } else {
            diet.add(data);
            snackBar = SnackBar(
                content: Text("${data['name']} remove from the CART !!"),
                backgroundColor: Colors.green.withOpacity(0.7),
                behavior: SnackBarBehavior.floating);
          }
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(
          Icons.fastfood_sharp,
        ),
        label: const Text("Add To Diet"),
      ),
    );
  }
}
