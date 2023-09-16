import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String name;
  final String description;
  final double price;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_produk'],
      name: json['nama_produk'],
      description: json['deskripsi'],
      price: json['harga'].toDouble(),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:3306/API_ECOMMERCE/produk.php'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> data = json.decode(response.body);
        products = data.map((item) => Product.fromJson(item)).toList();
      });
    } else {
      print('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
            trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
