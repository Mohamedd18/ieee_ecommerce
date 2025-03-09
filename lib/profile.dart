import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ieee_ecommerce/register.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
    );
    return MaterialApp(
      theme: themeData,
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
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
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
                    Get.to(() => Register());
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
      ),
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
