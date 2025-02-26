import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/login.dart';
import 'package:ieee_ecommerce/search.dart';

import 'home.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/mm.jpg'),
                  radius: 70,
                ),
                Text(
                  'Mohamed waleed',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  'elmhalawy858@gmail.com',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: profile2(
                    x: 350,
                    text: 'My Orders',
                    icon: Icons.shopping_bag,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: profile2(
                    x: 326,
                    text: 'Help&Support',
                    icon: Icons.question_mark_rounded,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: profile2(
                    x: 355,
                    text: 'About Us',
                    icon: Icons.error,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: profile2(
                      x: 320,
                      text: 'Change Theme',
                      icon: Icons.sunny,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => Login());
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.exit_to_app),
                          Text(
                            'Logout',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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

class profile2 extends StatelessWidget {
  const profile2({
    super.key,
    required this.text,
    required this.icon,
    required this.x,
  });
  final String text;
  final IconData icon;
  final double x;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: x),
            child: Text(
              '>',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
