// product_detail_page.dart
import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Produk {
  final int id_produk;
  final String nama_produk;
  final double harga;
  final String deskripsi;

  Produk(
      {required this.id_produk,
      required this.nama_produk,
      required this.deskripsi,
      required this.harga});

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id_produk: json['id_produk'],
      nama_produk: json['nama_produk'],
      deskripsi: json['deskripsi'],
      harga: json['harga'].toDouble(),
    );
  }
}

class ViewRekomendasiProduk extends StatefulWidget {
  @override
  rekomendasi_makanan createState() => rekomendasi_makanan();
}

class rekomendasi_makanan extends State<ViewRekomendasiProduk> {
  List<Produk> produks = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('localhost/API_ECOMMERCE/produk.php'));

    if (response.statusCode == 200) {
      setState(() {
        List<dynamic> data = json.decode(response.body);
        produks = data.map((item) => Produk.fromJson(item)).toList();
      });
    } else {
      print('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Warna.Primary,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF27FAC7),
          ),
        ),
        title: Text(
          'PRODUCT PAGE',
          style: TextStyle(
              color: Warna.Secondary,
              fontFamily: 'URW',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_basket_outlined,
              color: Color(0xFF27FAC7),
            ),
          ),
        ],
        iconTheme: IconThemeData(
          color: Warna.TextBold, // Change the drawer icon color here
        ),
      ),
      body: ListView.builder(
        itemCount: produks.length,
        itemBuilder: (context, index) {
          ListTile(
            title: Text(produks[index].nama_produk),
            subtitle: Text(produks[index].deskripsi),
            trailing: Text('\$${produks[index].harga.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
