import 'package:flutter/material.dart';

import 'api/Product.dart';
import 'apiManager/apiSearch.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Product> searchResults = [];

  void searchProducts(String query) async {
    if (query.isNotEmpty) {
      ApiSearch apiSearch = ApiSearch(productName: query);
      List<Product> products = await apiSearch.getProducts();

      setState(() {
        searchResults = products;
      });
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search",
                border: OutlineInputBorder(),
              ),
              onChanged: searchProducts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(searchResults[index].title ?? ''),
                  subtitle: Text("\$${searchResults[index].price}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
