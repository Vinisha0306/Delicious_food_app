import 'package:delicious_food_app/utils/routes_utils.dart';
import 'package:delicious_food_app/views/commponets/all_product.dart';
import 'package:delicious_food_app/views/commponets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:delicious_food_app/views/commponets/ad_poster.dart';
import 'package:delicious_food_app/utils/food_product_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountEmail: Text('lathiyavinisha03@gmail.com'),
              accountName: Text('Vinisha Lathiya'),
              currentAccountPicture: CircleAvatar(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    allFoods.length,
                    (index) => Card(
                      color: Colors.primaries[index % 18].withOpacity(0.2),
                      child: ListTile(
                        onTap: () {
                          Navigator.of(context).pushNamed(MyRoutes.detailPage,
                              arguments: allFoods[index]);
                        },
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(allFoods[index]['thumb']),
                        ),
                        title: Text(allFoods[index]['name']),
                        subtitle: Text(allFoods[index]['time']),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        // List.generate(allFoods.length, (index) => Text(allFoods[index][name]),),
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MyRoutes.dietPage);
            },
            child: Container(
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
        child: Expanded(
          flex: 4,
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    image.length,
                    (index) =>
                        poster(context: context, size: size, index: index),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              search(context: context, size: size),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      allFoods.length,
                      (index) => all_product(
                          context: context, size: size, index: index),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
