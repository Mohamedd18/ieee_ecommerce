import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/profile.dart';

import 'home.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Text(
                      'search product...',
                      style: TextStyle(color: Colors.grey, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
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
