import 'package:flutter/material.dart';
import 'package:Policy_Centre_Point/warna.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class CartItem {
  final Product product;
  int quantity;

  CartItem(this.product, this.quantity);
}

class keranjang extends StatelessWidget {
  final List<Product> products = [
    Product('Product 1', 10.99),
    Product('Product 2', 19.99),
    Product('Product 3', 7.50),
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CartPage(products: products),
    );
  }
}

class CartPage extends StatefulWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<CartItem> _cartItems = [];

  void _addToCart(Product product) {
    bool itemExists = false;

    for (var item in _cartItems) {
      if (item.product == product) {
        setState(() {
          item.quantity++;
        });
        itemExists = true;
        break;
      }
    }

    if (!itemExists) {
      setState(() {
        _cartItems.add(CartItem(product, 1));
      });
    }
  }

  void _removeFromCart(CartItem cartItem) {
    setState(() {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      } else {
        _cartItems.remove(cartItem);
      }
    });
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
          'KERANJANG',
          style: TextStyle(
              color: Color(0xFF27FAC7),
              fontFamily: 'URW',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        actions: [],
        iconTheme: IconThemeData(
          color: Warna.TextBold, // Change the drawer icon color here
        ),
      ),
      body: Card(
        child: ListView.builder(
          itemCount: widget.products.length,
          itemBuilder: (context, index) {
            Product product = widget.products[index];
            int quantity = _cartItems
                .firstWhere((item) => item.product == product,
                    orElse: () => CartItem(product, 0))
                .quantity;

            return ListTile(
              title: Text(
                product.name,
                style: TextStyle(
                    fontFamily: 'URW',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Warna.Primary),
              ),
              subtitle: Text('Price: \$${product.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () => _removeFromCart(_cartItems
                        .firstWhere((item) => item.product == product)),
                  ),
                  Text(quantity.toString()),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () => _addToCart(product),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
