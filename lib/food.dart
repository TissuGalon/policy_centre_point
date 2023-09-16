import 'package:flutter/material.dart';

void main() {
  runApp(Food());
}

class FoodItem {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Food extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Pizza',
      description: 'Delicious pizza with cheese and toppings.',
      price: 10.99,
      imageUrl:
          'https://via.placeholder.com/200', // Replace with actual image URL
    ),
    FoodItem(
      name: 'Burger',
      description: 'Juicy burger with lettuce and sauce.',
      price: 7.99,
      imageUrl:
          'https://via.placeholder.com/200', // Replace with actual image URL
    ),
    FoodItem(
      name: 'Pasta',
      description: 'Creamy pasta with herbs and sauce.',
      price: 8.99,
      imageUrl:
          'https://via.placeholder.com/200', // Replace with actual image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Food Card Example'),
        ),
        body: ListView.builder(
          itemCount: foodItems.length,
          itemBuilder: (context, index) {
            return FoodCard(
              foodItem: foodItems[index],
            );
          },
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;

  FoodCard({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(foodItem.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              foodItem.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              foodItem.description,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${foodItem.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
