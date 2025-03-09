import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ieee_ecommerce/apiManager/apiManager.dart';

import 'api/Product.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'Categories',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  SizedBox(width: 10),
                  categories(
                    text: 'All',
                    y: 40,
                  ),
                  SizedBox(width: 10),
                  categories(text: 'Electronics', y: 100),
                  SizedBox(width: 10),
                  categories(text: 'Fashion', y: 80),
                  SizedBox(width: 10),
                  categories(text: 'Home & Kitchen', y: 150),
                  SizedBox(width: 10),
                  categories(text: 'T-shirt', y: 100),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: ApiManger().getProducts(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('no product'));
                }
                final products = snapshot.data;
                return GridView.builder(
                  itemCount: snapshot.data?.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    final item = products![index];
                    return tshirt2(
                      iamgeUrl: products![index].image?[0] ?? '',
                      productName: item.title,
                      price: item.price,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class tshirt2 extends StatelessWidget {
  const tshirt2({
    super.key,
    required this.iamgeUrl,
    required this.productName,
    required this.price,
  });
  final String iamgeUrl;
  final String productName;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CachedNetworkImage(
                height: 180,
                width: double.infinity,
                imageUrl: iamgeUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Text(error.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13.0),
              child: Text(
                productName,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                price.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            )
          ],
        ),
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
      height: 80,
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
