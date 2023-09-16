import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String id;
  final String name;

  Product({required this.id, required this.name});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id_produk'],
      name: json['nama_produk'],
    );
  }
}

class DataProduk {
  final String apiUrl;

  DataProduk(this.apiUrl);

  Future<List<Product>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<Product> products =
          jsonData.map((data) => Product.fromJson(data)).toList();
      return products;
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
}

//Memanggil Data
void main() async {
  final dataproduk = DataProduk('http://localhost/API_ECOMMERCE/produk.php');

  try {
    final products = await dataproduk.fetchData();

    for (var product in products) {
      print('Product ID: ${product.id}, Nama Produk: ${product.name}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
