import 'package:flutter/material.dart';
import 'package:pembukuan_apps/utils/design_system.dart';

class Product {
  final String name;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });
}

List<Product> products = [
  Product(
    name: 'Product 1',
    description: 'Description of Product 1',
    price: 25.99,
  ),
  Product(
    name: 'Product 2',
    description: 'Description of Product 2',
    price: 35.99,
  ),
  // Add other products here
];

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        iconTheme: IconThemeData(color: DesignSystem.whiteColor),
        actions: [
          IconButton(
            icon: Icon(Icons.history), // Ikon riwayat
            onPressed: () {
              // Tambahkan logika untuk menavigasi ke halaman riwayat di sini
              // Misalnya, Navigator.push ke halaman riwayat
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(
                products[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(products[index].description),
              trailing: Text(
                '\$${products[index].price.toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
