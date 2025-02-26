import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/profile.dart';
import 'package:ieee_ecommerce/search.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            children: [
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    categories(
                      text: 'All',
                      y: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    categories(
                      y: 100,
                      text: 'Electronics',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    categories(
                      y: 80,
                      text: 'Fashion',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    categories(
                      y: 150,
                      text: 'Home & Kitchen',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    categories(
                      y: 100,
                      text: 'T-shirt',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Tshirt(),
              Tshirt(),
              Tshirt(),
              Tshirt(),
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 61,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => home());
                          },
                          icon: Icon(Icons.home),
                        ),
                        Text('Home')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Search(),
                                ));
                          },
                          icon: Icon(Icons.search),
                        ),
                        Text('Search')
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(() => profile());
                          },
                          icon: Icon(Icons.person),
                        ),
                        Text('Profile')
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}

class Tshirt extends StatelessWidget {
  const Tshirt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: tshirt2(),
          ),
          tshirt2(),
        ],
      ),
    );
  }
}

class tshirt2 extends StatelessWidget {
  const tshirt2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey),
      child: Column(
        children: [
          Image.network(
              'data:image/jpeg;base64,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'),
          Text(
            'Product Name',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$99.99',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green),
          )
        ],
      ),
    );
  }
}

class categories extends StatelessWidget {
  const categories({
    super.key,
    required this.text,
    required this.y,
  });
  final String text;

  final double y;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: y,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.black),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
